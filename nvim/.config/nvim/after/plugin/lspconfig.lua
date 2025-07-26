local util = require("lspconfig.util")
local fmt_grp = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
local root_dir = util.root_pattern("package.json", ".git")
local function exists(fname)
	local stat = vim.loop.fs_stat(fname)
	return stat and stat.type == "file"
end
local base_caps = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(base_caps)

local function reload_workspace(bufnr)
	local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "rust_analyzer" })
	for _, client in ipairs(clients) do
		vim.notify("Reloading Cargo Workspace")
		client.request("rust-analyzer/reloadWorkspace", nil, function(err)
			if err then
				error(tostring(err))
			end
			vim.notify("Cargo workspace reloaded")
		end, 0)
	end
end

local function is_library(fname)
	local user_home = vim.fs.normalize(vim.env.HOME)
	local cargo_home = os.getenv("CARGO_HOME") or user_home .. "/.cargo"
	local registry = cargo_home .. "/registry/src"
	local git_registry = cargo_home .. "/git/checkouts"

	local rustup_home = os.getenv("RUSTUP_HOME") or user_home .. "/.rustup"
	local toolchains = rustup_home .. "/toolchains"

	for _, item in ipairs({ toolchains, registry, git_registry }) do
		if vim.fs.relpath(item, fname) then
			local clients = vim.lsp.get_clients({ name = "rust_analyzer" })
			return #clients > 0 and clients[#clients].config.root_dir or nil
		end
	end
end

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = {
		".git",
		"package.json",
		".eslintrc",
		".eslintrc.json",
		".eslintrc.js",
		".eslintrc.cjs",
	},
})
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"eslint",
		"rust_analyzer",
		"ts_ls",
		"pyright",
		"gopls",
		"clangd",
		"html",
		"kotlin_language_server",
	},
})

local function attach_fmt(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = fmt_grp, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = fmt_grp,
			buffer = bufnr,
			callback = function()
				require("conform").format({ bufnr = bufnr })
			end,
		})
	end
end

local servers = {
	protobuf_language_server = {
		default_config = {
			cmd = { "/home/urizen/go/bin/protobuf-language-server" },
			filetypes = { "proto", "cpp" },
			root_dir = util.root_pattern(".git"),
			single_file_support = true,
		},
	},

	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
				diagnostics = { globals = { "vim" } },
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
					maxPreload = 10000,
					preloadFileSize = 1000,
				},
				telemetry = { enable = false },
			},
		},
	},

	eslint = {
		on_attach = attach_fmt,
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},

	rust_analyzer = {
		cmd = { "rust-analyzer" },
		filetypes = { "rust" },
		root_dir = function(bufnr, on_dir)
			local fname = vim.api.nvim_buf_get_name(bufnr)
			local reused_dir = is_library(fname)
			if reused_dir then
				on_dir(reused_dir)
				return
			end

			local cargo_crate_dir = vim.fs.root(fname, { "Cargo.toml" })
			local cargo_workspace_root

			if cargo_crate_dir == nil then
				on_dir(
					vim.fs.root(fname, { "rust-project.json" })
						or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
				)
				return
			end

			local cmd = {
				"cargo",
				"metadata",
				"--no-deps",
				"--format-version",
				"1",
				"--manifest-path",
				cargo_crate_dir .. "/Cargo.toml",
			}

			vim.system(cmd, { text = true }, function(output)
				if output.code == 0 then
					if output.stdout then
						local result = vim.json.decode(output.stdout)
						if result["workspace_root"] then
							cargo_workspace_root = vim.fs.normalize(result["workspace_root"])
						end
					end

					on_dir(cargo_workspace_root or cargo_crate_dir)
				else
					vim.schedule(function()
						vim.notify(
							("[rust_analyzer] cmd failed with code %d: %s\n%s"):format(output.code, cmd, output.stderr)
						)
					end)
				end
			end)
		end,
		capabilities = {
			experimental = {
				serverStatusNotification = true,
			},
		},
		before_init = function(init_params, config)
			if config.settings and config.settings["rust-analyzer"] then
				init_params.initializationOptions = config.settings["rust-analyzer"]
			end
		end,
		on_attach = function()
			vim.api.nvim_buf_create_user_command(0, "LspCargoReload", function()
				reload_workspace(0)
			end, { desc = "Reload current cargo workspace" })
		end,
	},
	ts_ls = {
		default_config = {
			init_options = { hostInfo = "neovim" },
			cmd = (function()
				local cwd = vim.loop.cwd()
				local tsls = vim.fn.exepath("typescript-language-server")
				local base = { "node", "--max-old-space-size=8192", tsls, "--stdio" }
				if exists(cwd .. "/.pnp.cjs") or exists(cwd .. "/.pnp.loader.mjs") then
					return vim.list_extend({ "yarn", "pnpify", "--sdk" }, base)
				end
				return base
			end)(),
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
			single_file_support = true,
			flags = {
				debounce_text_changes = 200,
			},
		},
		on_attach = function(client, bufnr)
			client.server_capabilities.semanticTokensProvider = nil
			if client.server_capabilities.inlayHintProvider then
				client.server_capabilities.inlayHintProvider = nil
			end
			attach_fmt(client, bufnr)
		end,
	},

	pyright = {
		settings = { python = { pythonPath = vim.fn.exepath("python") } },
		on_attach = attach_fmt,
	},

	gopls = {
		settings = {
			gopls = {
				analyses = { unusedparams = true },
				staticcheck = true,
				usePlaceholders = true,
				completeUnimported = true,
			},
		},
	},

	clangd = {
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
			"-j=4",
			"--background-index",
			"--clang-tidy",
			"--completion-style=detailed",
		},
		filetypes = { "c", "cpp", "objc", "objcpp" },
		root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
	},

	html = {
		filetypes = { "html" },
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = { css = true, javascript = true },
			provideFormatter = true,
		},
	},
}

for name, cfg in pairs(servers) do
	cfg.capabilities = cfg.capabilities or capabilities
	cfg.on_attach = cfg.on_attach or attach_fmt
	vim.lsp.config(name, cfg)
end

vim.api.nvim_create_autocmd("BufWritePre", {
	group = fmt_grp,
	pattern = "*",
	callback = function()
		require("conform").format({ lsp_fallback = true })
	end,
})
