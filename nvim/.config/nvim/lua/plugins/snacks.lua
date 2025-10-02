local function merge(dst, src)
  return vim.tbl_deep_extend("force", dst or {}, src or {})
end

return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts = opts or {}
    opts.explorer = merge(opts.explorer, {
      enabled = true,
      replace_netrw = true,
    })
    opts.picker = opts.picker or {}
    opts.picker.sources = opts.picker.sources or {}
    opts.picker.sources.explorer = merge(opts.picker.sources.explorer, {
      auto_close = false,
      follow_file = true,
      focus = "list",
      jump = { close = true },
      layout = {
        preset = "sidebar",
        layout = { position = "left" },
        preview = false,
      },
      hidden = true,
      ignored = true,
    })
    return opts
  end,
}
