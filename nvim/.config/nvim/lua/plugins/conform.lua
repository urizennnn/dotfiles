return {
    "stevearc/conform.nvim",
    init = function()
        local grp = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = grp,
            pattern = "*",
            callback = function()
                pcall(function()
                    require("conform").format({ lsp_fallback = true })
                end)
            end,
        })
    end,

    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            rust = { "rustfmt", lsp_format = "fallback" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            go = { "gofmt", "gofumpt" },
        },
        formatters = {
            yamlfmt = {
                command = "yamlfmt",
                args = { "-formatter", "basic", "-indentless_arrays=true" },
            },
        },
    },
}
