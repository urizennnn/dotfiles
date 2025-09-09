return {
  "stevearc/conform.nvim",

  opts = {
    notify_on_error = true,

    -- format_on_save = function(bufnr)
    --   local ft = vim.bo[bufnr].filetype
    --   if
    --     ft == "javascript"
    --     or ft == "javascriptreact"
    --     or ft == "typescript"
    --     or ft == "typescriptreact"
    --     or ft == "vue"
    --   then
    --     return { lsp_fallback = false, timeout_ms = 3000 }
    --   end
    --   return { lsp_fallback = true, timeout_ms = 3000 }
    -- end,
    --
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt" },
      go = { "gofumpt", "gofmt" },

      javascript = { "eslint_d", "prettierd", "prettier" },
      typescript = { "eslint_d", "prettierd", "prettier" },
      javascriptreact = { "eslint_d", "prettierd", "prettier" },
      typescriptreact = { "eslint_d", "prettierd", "prettier" },
      vue = { "eslint_d", "prettierd", "prettier" },

      yaml = { "yamlfmt" },
      json = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      scss = { "prettierd", "prettier" },
    },

    formatters = {
      yamlfmt = {
        command = "yamlfmt",
        args = { "-formatter", "basic", "-indentless_arrays=true" },
      },

      eslint_d = {
        condition = function(ctx)
          local root = require("conform.util").root_file({
            "eslint.config.js",
            "eslint.config.mjs",
            "eslint.config.cjs",
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.json",
            ".eslintrc",
            "package.json",
          })
          return root(ctx) ~= nil
        end,
      },

      prettierd = {
        condition = function(ctx)
          local has_eslint = require("conform.util").root_file({
            "eslint.config.js",
            "eslint.config.mjs",
            "eslint.config.cjs",
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.json",
            ".eslintrc",
          })(ctx) ~= nil
          return not has_eslint
        end,
      },
    },
  },
}
