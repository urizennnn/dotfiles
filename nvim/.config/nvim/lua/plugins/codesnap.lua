return {
  "mistricky/codesnap.nvim",
  build = "make",
  lazy = true,
  cmd = { "CodeSnap", "CodeSnapSave" },
  config = function()
    require("codesnap").setup({
      border = "rounded",
      has_breadcrumbs = true,
      show_workspace = true,
      has_line_number = true,
      bg_color = "#535c68",
      bg_theme = "grape",
      watermark = "URIZEN",
    })
  end,
}
