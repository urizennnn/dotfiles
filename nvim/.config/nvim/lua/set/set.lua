
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.lsp.set_log_level("ERROR") -- Reduce LSP logging

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "rounded"
	opts.max_width = opts.max_width or 80
	opts.max_height = opts.max_height or 20
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	callback = function()
		vim.opt_local.complete = ".,w,b,u,t"
		vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "ts_ls" then
			-- Enable auto-import code actions
			client.server_capabilities.codeActionProvider = {
				codeActionKinds = {
					"quickfix",
					"refactor",
					"refactor.extract",
					"refactor.inline",
					"refactor.rewrite",
					"source",
					"source.organizeImports",
				},
				resolveProvider = true,
			}
		end
	end,
})
vim.opt.cursorline = false
vim.g.lazyvim_eslint_auto_format = true
vim.loader.enable()
vim.opt.pumheight = 5
vim.opt.smartcase = true
vim.diagnostic.config({
	virtual_text = { current_line = true },
})
vim.lsp.inlay_hint.enable(true)
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = ""

vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.guicursor = {
	"n-v-c:block",
	"i-ci-ve:ver25",
	"r-cr:hor20",
	"o:hor50",
	"a:blinkwait0-blinkon0-blinkoff0",
}
vim.g.db_ui_use_nvim_notify = 1
vim.g.lazydev_enabled = true
vim.g.mkdp_port = 2000
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_page_title = "「${name}」"
vim.g.mkdp_filetypes = { "markdown" }
vim.g.mkdp_theme = "dark"
vim.g.loaded_netrwPlugin = 1

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.updatetime = 250

vim.g.clipboard = {
	name = "wl-clipboard",
	copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
	paste = { ["+"] = "wl-paste --no-newline", ["*"] = "wl-paste --no-newline" },
	cache_enabled = 0,
}
vim.opt.clipboard = "unnamedplus"
vim.g.have_nerd_font = true
vim.opt.scrollback = 100000
vim.opt.number = true
vim.opt.showmode = true

local macro_group = vim.api.nvim_create_augroup("MacroRecording", { clear = true })
vim.api.nvim_create_autocmd("RecordingLeave", {
	group = macro_group,
	callback = function()
		print("Macro recording stopped")
	end,
})

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.timeoutlen = 300
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.scrolloff = 10
vim.opt.hlsearch = true

vim.g.augment_workspace_folders = {
	-- "/home/urizen/sefarvest-backend",
	"/home/urizen/fonu-api",
	-- "/home/urizen/fonu-work/fonu-power/"
	-- "/home/urizen/api.godaesil",
}
-- Add this to your LSP configuration for better auto-import behavior

-- Auto-import keybinding for manual triggering
vim.keymap.set("n", "<leader>ci", function()
	vim.lsp.buf.code_action({
		filter = function(action)
			return action.kind and string.match(action.kind, "source%.addMissingImports")
		end,
		apply = true,
	})
end, { desc = "Add missing imports" })

-- Auto-import on save for TypeScript/JavaScript files
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
	callback = function(args)
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.addMissingImports.ts" } }

		local result = vim.lsp.buf_request_sync(args.buf, "textDocument/codeAction", params, 1000)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = vim.lsp.get_client_by_id(cid).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
	end,
})

-- Enhanced TypeScript LSP settings for better completion
local enhanced_ts_settings = {
	typescript = {
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
		inlayHints = {
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = false,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
		},
	},
	javascript = {
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
}

-- Update your ts_ls server configuration with these settings
-- In your servers table:
-- ts_ls = {
--     settings = enhanced_ts_settings,
-- },
