-- Set up options for key mappings
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Set the leader key to Space
vim.g.mapleader = " "

-- ===============================
-- 🟢 BUFFER AND FILE MANAGEMENT
-- ===============================

keymap("n", "<leader>x", "<cmd> :bdelete <cr>") -- Close the current buffer
keymap("n", "<leader>n", "<cmd> bn <cr>") -- Move to the next buffer
keymap("n", "W", "<cmd> w<CR>") -- Save the current file
keymap("n", "wq", "<cmd> wq<CR>") -- Save and close the file
keymap("n", "Q", "<cmd> quitall<CR>") -- Quit Neovim, closing all buffers
keymap("n", "qq", "<cmd> qa<CR>") -- Quit Neovim without saving
keymap("n", "so", "<cmd> so<CR>") -- Reload (source) the current file
keymap("n", "<leader><leader>", "<cmd>e#<CR>", opts) -- Switch back to the previous buffer

-- ===============================
-- 🟢 WINDOW MANAGEMENT
-- ===============================

keymap("n", "vs", "<cmd> :vs <cr>") -- Open a vertical split
keymap("n", "<A-Up>", "<cmd> resize +2<CR>") -- Increase window height
keymap("n", "<C-Down>", "<cmd> resize -2<CR>") -- Decrease window height
keymap("n", "<C-Left>", "<cmd> vertical resize +2<CR>") -- Increase window width
keymap("n", "<C-Right>", "<cmd> vertical resize -2<CR>") -- Decrease window width

-- ===============================
-- 🟢 FILE EXPLORER
-- ===============================

keymap("n", "<leader>", ":NvimTreeToggle<CR>", { noremap = true, silent = true }) -- Toggle the NvimTree file explorer

-- ===============================
-- 🟢 CLIPBOARD AND COPY-PASTE
-- ===============================

keymap("n", "<C-v>", '"+p"') -- Paste from system clipboard
keymap("n", "<C-c>", '"+y"') -- Copy to system clipboard
keymap("v", "p", '"_dP', opts) -- Paste without replacing register

-- ===============================
-- 🟢 LINE NAVIGATION
-- ===============================

keymap("n", "<C-d>", "10j") -- Move down 10 lines
keymap("n", "<C-u>", "10k") -- Move up 10 lines
keymap("v", "J", ":m '>+1<CR>gv=gv", { silent = true }) -- Move selected lines down
keymap("v", "K", ":m '<-2<CR>gv=gv", { silent = true }) -- Move selected lines up

-- ===============================
-- 🟢 GIT INTEGRATION
-- ===============================

keymap("n", "GB", "<cmd>GitBlameToggle<return>", { silent = true, noremap = true }) -- Toggle Git Blame
keymap("n", "open", "<cmd>:GitBlameOpenCommitURL<CR>", { silent = true, noremap = true }) -- Open commit URL

-- ===============================
-- 🟢 TELESCOPE SEARCH
-- ===============================

keymap("n", "help", "<cmd> :Telescope help_tags<CR>", { silent = true }) -- Open Neovim help tags in Telescope

-- ===============================
-- 🟢 LIVE SERVER CONTROL
-- ===============================

keymap("n", "live", "<cmd>:LiveServerStart<CR>", { silent = true }) -- Start Live Server
keymap("n", "stop", "<cmd>:LiveServerStop<CR>", { silent = true }) -- Stop Live Server

-- ===============================
-- 🟢 LSP INTEGRATION
-- ===============================

local bufnr = vim.api.nvim_get_current_buf()
keymap("n", "<leader>a", function()
	vim.cmd.RustLsp("codeAction") -- Trigger LSP code action
end, { silent = true, buffer = bufnr })

keymap("n", "cargo", function()
	vim.cmd.RustLsp("openCargo") -- Open Cargo.toml for Rust projects
end)

keymap("n", "<leader>h", function()
	vim.cmd.RustLsp({ "hover", "actions" }) -- Show hover actions for LSP
end)

-- ===============================
-- 🟢 TODO MANAGEMENT
-- ===============================

keymap("n", "<leader>t", ":TodoTelescope<CR>", { silent = true }) -- Open TODO list using Telescope

-- ===============================
-- 🟢 DATABASE MANAGEMENT
-- ===============================

keymap("n", "db", "<cmd>DBUIToggle<CR>") -- Toggle database UI
keymap("n", "dbs", "<cmd>DBUIAddConnection<CR>") -- Add a new database connection

-- ===============================
-- 🟢 TABS MANAGEMENT
-- ===============================

keymap("n", "tt", "<cmd>tabnew<CR>") -- Open a new tab
keymap("n", "tq", "<cmd>tabclose<CR>") -- Close the current tab
keymap("n", "tn", "<cmd>tabnext<CR>") -- Move to the next tab

-- ===============================
-- 🟢 MARKDOWN PREVIEW
-- ===============================

keymap("n", "md", "<cmd>RenderMarkdown toggle<CR>") -- Toggle Markdown preview

-- ===============================
-- 🟢 NAVIGATION IN INSERT MODE
-- ===============================

keymap("i", "<C-h>", "<Left>", opts) -- Move left
keymap("i", "<C-j>", "<Down>", opts) -- Move down
keymap("i", "<C-k>", "<Up>", opts) -- Move up
keymap("i", "<A-l>", "<Right>", opts) -- Move right

-- ===============================
-- 🟢 DIAGNOSTICS (LSP ERRORS/WARNINGS)
-- ===============================
local function show_diagnostics()
	vim.diagnostic.open_float(nil, {
		focus = false,
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		format = function(diagnostic)
			local lsp_name = diagnostic.source and string.format("LSP: %s", diagnostic.source) or "LSP: Unknown"
			local error_message = string.format("%s [%s]", diagnostic.message, diagnostic.code or "N/A")
			return string.format("%s\n%s", lsp_name, error_message)
		end,
	})
end

keymap("n", "<leader><Enter>", show_diagnostics, opts) -- Show LSP diagnostics in floating window

-- ===============================
-- 🟢 DISABLE PGUP/PGDN KEYS IN NORMAL MODE
-- ===============================

keymap("n", "<PageUp>", "<Nop>", { noremap = true, silent = true }) -- Disable PageUp
keymap("n", "<PageDown>", "<Nop>", { noremap = true, silent = true }) -- Disable PageDown

-- ===============================
-- 🟢 DISABLE PGUP/PGDN KEYS IN INSERT MODE
-- ===============================

keymap("i", "<PageUp>", "<Nop>", { noremap = true, silent = true }) -- Disable PageUp in insert mode
keymap("i", "<PageDown>", "<Nop>", { noremap = true, silent = true }) -- Disable PageDown in insert mode

-- ===============================
-- 🟢 DISABLE PGUP/PGDN KEYS IN VISUAL MODE
-- ===============================

keymap("v", "<PageUp>", "<Nop>", { noremap = true, silent = true }) -- Disable PageUp in visual mode
keymap("v", "<PageDown>", "<Nop>", { noremap = true, silent = true }) -- Disable PageDown in visual mode

-- ===============================
-- 🟢 CLOSE NOTIFICATION POPUP
-- ===============================
keymap("n", "nd", "<cmd>NoiceDismiss<CR>", { noremap = true, silent = true })

keymap("n", "git", "<cmd>LazyGit<CR>", opts)
