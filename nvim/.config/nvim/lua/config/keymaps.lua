local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })

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
-- 🟢 CLIPBOARD AND COPY-PASTE
-- ===============================

keymap("n", "<C-v>", '"+p"') -- Paste from system clipboard
keymap("n", "<C-c>", '"+y"') -- Copy to system clipboard
keymap("v", "p", '"_dP', opts) -- Paste without replacing register

-- ===============================
-- 🟢 LINE NAVIGATION
-- ===============================

keymap({ "n", "i" }, "<C-d>", "10j") -- Move down 10 lines
keymap({ "n", "i" }, "<C-u>", "10k") -- Move up 10 lines
keymap("v", "J", ":m '>+1<CR>gv=gv", { silent = true }) -- Move selected lines down
keymap("v", "K", ":m '<-2<CR>gv=gv", { silent = true }) -- Move selected lines up

-- ===============================
-- 🟢 GIT INTEGRATION
-- ===============================

keymap("n", "gs", function()
  Snacks.gitbrowse()
end, { silent = true }) -- Open Git status
keymap("n", "git", function()
  Snacks.lazygit.open()
end, opts)

-- ===============================
-- 🟢 TABS MANAGEMENT
-- ===============================

keymap("n", "tt", "<cmd>tabnew<CR>") -- Open a new tab
keymap("n", "tq", "<cmd>tabclose<CR>") -- Close the current tab
keymap("n", "tn", "<cmd>tabnext<CR>") -- Move to the next tab
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

keymap("n", "M", "<cmd>Mason<CR>", opts)
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap("n", "es", "<cmd>EslintFixAll<CR>", { desc = "Fix all eslint errors", silent = true })

keymap("n", "<leader>t", "<cmd>TodoFzfLua<CR>", { desc = "TODOs (FzfLua)", silent = true })

-- ===============================
-- 🟢 MARKDOWN PREVIEW
-- ===============================

keymap("n", "md", "<cmd>RenderMarkdown toggle<CR>") -- Toggle Markdown preview

keymap("n", "re", "<cmd>lua require('snacks').picker.buffers()<CR>", { desc = "Open recent buffers" })
keymap({ "n", "t" }, "<C-n>", "<C-_>", { remap = true, silent = true })

keymap("n", "<leader>", function()
  require("snacks").picker.explorer({ cwd = vim.uv.cwd() })
end, { desc = "Explorer Snacks (cwd)" })
keymap({ "n", "x" }, "mg", LazyVim.pick("grep"), { desc = "Grep word/selection (Root Dir)" })

keymap("n", "<leader>f", function()
  require("snacks").picker.files()
end)

keymap("n", "pr", "<Cmd>Octo pr list<CR>")
keymap("n", "<leader>O", "<cmd>Octo<CR>")

