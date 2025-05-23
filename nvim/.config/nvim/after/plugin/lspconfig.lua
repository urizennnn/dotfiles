local util = require("lspconfig.util")
local fmt_grp = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

local base_caps = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(base_caps)

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
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
	},

	rust_analyzer = {},

	ts_ls = {
		default_config = {
			init_options = { hostInfo = "neovim" },
			cmd = { "typescript-language-server", "--stdio" },
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
