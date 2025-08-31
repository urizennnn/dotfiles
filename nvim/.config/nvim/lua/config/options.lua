vim.opt.wrap = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.cursorline = false
vim.g.lazyvim_eslint_auto_format = false
vim.loader.enable()
vim.opt.pumheight = 5
vim.opt.smartcase = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = ""
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.g.db_ui_use_nvim_notify = 1
vim.g.lazydev_enabled = true
vim.g.mkdp_port = 2000
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_page_title = "「${name}」"
vim.g.mkdp_filetypes = { "markdown" }
vim.g.mkdp_theme = "dark"
vim.g.loaded_netrwPlugin = 1
vim.opt.scrollback = 100000
vim.opt.number = true
vim.opt.showmode = true
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
vim.o.timeout = true
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50
vim.o.updatetime = 250
vim.g.clipboard = {
    name = "wl-clipboard",
    copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
    paste = { ["+"] = "wl-paste --no-newline", ["*"] = "wl-paste --no-newline" },
    cache_enabled = 0,
}
