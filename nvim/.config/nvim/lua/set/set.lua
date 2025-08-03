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
	"/home/urizen/sefarvest-backend",
	"/home/urizen/fonu-api",
	"/home/urizen/api.godaesil",
}
