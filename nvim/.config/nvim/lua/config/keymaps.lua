local keymap = vim.keymap.set

local function map(mode, lhs, rhs, desc, opts)
  local options = vim.tbl_extend("force", { silent = true }, opts or {})
  if desc then
    options.desc = desc
  end
  keymap(mode, lhs, rhs, options)
end

local function get_snacks()
  local ok, snacks = pcall(require, "snacks")
  if not ok then
    vim.notify("Snacks is not available", vim.log.levels.WARN)
    return nil
  end
  return snacks
end

local function with_lsp(fn)
  return function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
      vim.notify("No LSP client attached to current buffer", vim.log.levels.WARN)
      return
    end
    fn()
  end
end

local function toggle_snacks_explorer()
  local snacks = get_snacks()
  if not snacks then
    return
  end

  local existing = snacks.picker.get({ source = "explorer" })[1]
  if existing and not existing.closed then
    existing:close()
    return
  end

  local picker = snacks.explorer.open()
  if picker then
    picker:focus("list", { show = true })
  end
end

local function focus_snacks_explorer()
  local snacks = get_snacks()
  if not snacks then
    return
  end

  local existing = snacks.picker.get({ source = "explorer" })[1]
  if existing and not existing.closed then
    existing:focus("list", { show = true })
    return
  end

  local picker = snacks.explorer.open()
  if picker then
    picker:focus("list", { show = true })
  end
end

local function show_diagnostics()
  vim.diagnostic.open_float(nil, {
    focus = false,
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    format = function(diagnostic)
      local lsp_name = diagnostic.source and ("LSP: " .. diagnostic.source) or "LSP: Unknown"
      local error_message = string.format("%s [%s]", diagnostic.message, diagnostic.code or "N/A")
      return string.format("%s\n%s", lsp_name, error_message)
    end,
  })
end

-- ===============================
-- 🟢 CORE
-- ===============================

map("i", "jk", "<Esc>", "Exit insert mode")
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlight")
map("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
map("n", "<leader>z", "za", "Toggle fold")

-- ===============================
-- 🟢 BUFFER AND FILE MANAGEMENT
-- ===============================

map("n", "<leader>x", "<cmd>bdelete<CR>", "Close current buffer")
map("n", "<leader>n", "<cmd>bn<CR>", "Next buffer")
map("n", "<leader><leader>", "<cmd>e#<CR>", "Previous buffer")

map("n", "<leader>f", function()
  local snacks = get_snacks()
  if snacks then
    snacks.picker.files()
  end
end, "Find files")

map("n", "W", "<cmd>w<CR>", "Save file")
map("n", "wq", "<cmd>wq<CR>", "Save and quit")
map("n", "Q", "<cmd>qa<CR>", "Quit all")
map("n", "qq", "<cmd>qa!<CR>", "Quit all without saving")
map("n", "so", "<cmd>source %<CR>", "Source current file")

-- ===============================
-- 🟢 WINDOW MANAGEMENT
-- ===============================

map("n", "vs", "<cmd>vsplit<CR>", "Vertical split")
map("n", "<A-Up>", "<cmd>resize +2<CR>", "Increase window height")
map("n", "<C-Down>", "<cmd>resize -2<CR>", "Decrease window height")
map("n", "<C-Left>", "<cmd>vertical resize +2<CR>", "Increase window width")
map("n", "<C-Right>", "<cmd>vertical resize -2<CR>", "Decrease window width")

-- ===============================
-- 🟢 CLIPBOARD AND PASTE
-- ===============================

map("n", "<C-v>", '"+p', "Paste from system clipboard")
map("n", "<C-c>", '"+y', "Copy to system clipboard")
map("v", "p", '"_dP', "Paste without replacing register")

-- ===============================
-- 🟢 MOVEMENT
-- ===============================

map("n", "<C-d>", "10j", "Move down 10 lines")
map("n", "<C-u>", "10k", "Move up 10 lines")
map("i", "<C-d>", "<Esc>10ji", "Move down 10 lines")
map("i", "<C-u>", "<Esc>10ki", "Move up 10 lines")

map("v", "J", ":m '>+1<CR>gv=gv", "Move selected lines down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move selected lines up")

map("i", "<C-h>", "<Left>", "Move left")
map("i", "<C-j>", "<Down>", "Move down")
map("i", "<C-k>", "<Up>", "Move up")
map("i", "<A-l>", "<Right>", "Move right")

-- ===============================
-- 🟢 EXPLORER / PICKERS
-- ===============================

map("n", "<leader>", toggle_snacks_explorer, "Toggle Snacks explorer")
map("n", "<C-.>", focus_snacks_explorer, "Focus Snacks explorer")

map("n", "re", function()
  local snacks = get_snacks()
  if snacks then
    snacks.picker.buffers()
  end
end, "Open recent buffers")

map("n", "nm", function()
  local snacks = get_snacks()
  if snacks then
    snacks.explorer.open()
  end
end, "Open Snacks explorer")

map({ "n", "x" }, "mg", LazyVim.pick("grep"), "Grep word/selection (Root Dir)")

-- ===============================
-- 🟢 GIT
-- ===============================

map("n", "gs", function()
  local snacks = get_snacks()
  if snacks then
    snacks.gitbrowse()
  end
end, "Git browse")

map("n", "git", function()
  local snacks = get_snacks()
  if snacks and snacks.lazygit then
    snacks.lazygit.open()
  end
end, "Open Lazygit")

map("n", "pr", "<cmd>Octo pr list<CR>", "List pull requests")
map("n", "<leader>O", "<cmd>Octo<CR>", "Open Octo")

-- ===============================
-- 🟢 TABS
-- ===============================

map("n", "tt", "<cmd>tabnew<CR>", "New tab")
map("n", "tq", "<cmd>tabclose<CR>", "Close tab")
map("n", "tn", "<cmd>tabnext<CR>", "Next tab")

-- ===============================
-- 🟢 DIAGNOSTICS AND LSP
-- ===============================

map("n", "<leader><Enter>", show_diagnostics, "Show diagnostics")
map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostics")
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP code action")

map("n", "gd", with_lsp(vim.lsp.buf.definition), "LSP go to definition")
map("n", "gr", with_lsp(vim.lsp.buf.references), "LSP references")
map("n", "grn", with_lsp(vim.lsp.buf.rename), "LSP rename")

map("n", "es", "<cmd>EslintFixAll<CR>", "Fix all ESLint errors")
map("n", "<leader>t", "<cmd>TodoFzfLua<CR>", "TODOs (FzfLua)")

-- ===============================
-- 🟢 MARKDOWN
-- ===============================

map("n", "md", "<cmd>RenderMarkdown toggle<CR>", "Toggle Markdown preview")

-- ===============================
-- 🟢 UI / TOOLS
-- ===============================

map("n", "nd", "<cmd>NoiceDismiss<CR>", "Dismiss notifications")
map("n", "M", "<cmd>Mason<CR>", "Open Mason")

-- ===============================
-- 🟢 DISABLED KEYS
-- ===============================

map("n", "<PageUp>", "<Nop>", "Disabled")
map("n", "<PageDown>", "<Nop>", "Disabled")
map("i", "<PageUp>", "<Nop>", "Disabled")
map("i", "<PageDown>", "<Nop>", "Disabled")
map("v", "<PageUp>", "<Nop>", "Disabled")
map("v", "<PageDown>", "<Nop>", "Disabled")
