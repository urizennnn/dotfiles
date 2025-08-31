vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "grn", vim.lsp.buf.rename, {silent = true, desc = "LSP Rename"})

require("config.lazy")

-- Import /lua/*
