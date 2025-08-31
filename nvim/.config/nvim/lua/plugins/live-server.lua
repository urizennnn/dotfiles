return {
  "barrett-ruth/live-server.nvim",
  build = "pnpm add -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  main = "live-server",
  opts = {
    args = { "--port=5500", "--browser=zen-browser" },
  },
}
