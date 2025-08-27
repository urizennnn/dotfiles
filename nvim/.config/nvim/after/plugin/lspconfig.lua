local util = require("lspconfig.util")
local fmt_grp = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

local function exists(fname)
	local stat = vim.loop.fs_stat(fname)
	return stat and stat.type == "file"
end

local base_caps = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("blink.cmp").get_lsp_capabilities(base_caps)

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

require("mason").setup()

local servers = {
	vtsls = {
		cmd = { "vtsls", "--stdio" },
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
		single_file_support = true,
		settings = {
			vtsls = {
				autoUseWorkspaceTsdk = true,
			},
			typescript = {
				format = { enable = false },
				tsserver = { maxTsServerMemory = 3072 },
				updateImportsOnFileMove = { enabled = "always" },
				suggest = {
					completeFunctionCalls = true,
					includeCompletionsForModuleExports = true,
					includeCompletionsWithInsertText = true,
				},
				preferences = {
					includePackageJsonAutoImports = "on",
					includeCompletionsForModuleExports = true,
				},
			},
			javascript = {
				format = { enable = false },
				updateImportsOnFileMove = { enabled = "always" },
				suggest = {
					completeFunctionCalls = true,
					includeCompletionsForModuleExports = true,
					includeCompletionsWithInsertText = true,
				},
				preferences = {
					includePackageJsonAutoImports = "on",
					includeCompletionsForModuleExports = true,
				},
			},
		},
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			if client.server_capabilities.semanticTokensProvider then
				client.server_capabilities.semanticTokensProvider = nil
			end

			attach_fmt(client, bufnr)
		end,
	},

	eslint = {
		cmd = { "vscode-eslint-language-server", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"vue",
			"svelte",
			"astro",
			"html",
		},
		root_dir = util.root_pattern(
			".eslintrc",
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.json",
			".eslintrc.yaml",
			".eslintrc.yml",
			"eslint.config.js",
			"eslint.config.cjs",
			"eslint.config.mjs",
			"package.json",
			".git"
		),
		settings = {
			workingDirectories = { mode = "auto" },
			format = false,
		},
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.code_action({
						context = { only = { "source.fixAll.eslint" } },
						apply = true,
					})
				end,
			})
		end,
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
		root_dir = util.root_pattern("compile_commands.json", ".git"),
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

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"eslint",
		"vtsls",
		"pyright",
		"gopls",
		"clangd",
		"html",
	},
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig")[server_name].setup(server)
		end,

		["vtsls"] = function()
			local server = servers.vtsls or {}
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig").vtsls.setup(server)
		end,

		["eslint"] = function()
			local server = servers.eslint or {}
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig").eslint.setup(server)
		end,
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = fmt_grp,
	pattern = "*",
	callback = function()
		require("conform").format({ lsp_fallback = true })
	end,
})
