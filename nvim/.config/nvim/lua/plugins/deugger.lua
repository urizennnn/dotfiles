return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "psql", "mongodb" } },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_icons = {
        expanded = "▾",
        collapsed = "▸",
        saved_query = "*",
        new_query = "+",
        tables = "~",
        buffers = "»",
        connection_ok = "✓",
        connection_error = "✕",
      }
      vim.g.db_ui_disable_progress_bar = 1
    end,
  },
}
