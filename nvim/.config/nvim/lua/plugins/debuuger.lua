return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts = opts or {}
      -- merge with anything LazyVim sets
      local ensure = opts.ensure_installed or {}
      for _, p in ipairs({ "delve", "js-debug-adapter" }) do
        if not vim.tbl_contains(ensure, p) then
          table.insert(ensure, p)
        end
      end
      opts.ensure_installed = ensure
      opts.automatic_installation = true
      return opts
    end,
  },

  { "leoluz/nvim-dap-go", ft = "go", opts = {} },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")

      local pkg = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"
      local server = pkg .. "/js-debug/src/dapDebugServer.js"

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "127.0.0.1",
        port = "${port}",
        executable = { command = "node", args = { server, "${port}" } },
      }

      local node_launch = {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
        skipFiles = { "<node_internals>/**" },
        outFiles = { "${workspaceFolder}/dist/**/*.js" },
      }

      dap.configurations.javascript = { node_launch }
      dap.configurations.typescript = { node_launch }
      dap.configurations.javascriptreact = { node_launch }
      dap.configurations.typescriptreact = { node_launch }
    end,
  },
}
