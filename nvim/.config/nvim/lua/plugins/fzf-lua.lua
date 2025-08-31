local fzf_opts = {
    ui_select = { enabled = true },
    files = {
        fd_opts = "--type f --hidden --follow --exclude .git",
    },
}

vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufEnter" }, {
    group = vim.api.nvim_create_augroup("QfSyncDiagnostics", { clear = true }),
    callback = function()
        pcall(vim.diagnostic.setqflist, { open = false })
    end,
})

local fzf_keymap = {
    {
        "<leader>f",
        function()
            require("fzf-lua").files()
        end,
        desc = "FZF: Find files",
    },
    {
        "re",
        function()
            require("fzf-lua").buffers()
        end,
        desc = "FZF: Recent files",
    },
    {
        "<C-o>",
        function()
            require("fzf-lua").oldfiles()
        end,
        desc = "FZF: Old files",
    },
    {
        "<leader>q",
        function()
            require("fzf-lua").quickfix()
        end,
        desc = "FZF: Quickfix",
    },
    {
        "mg",
        function()
            require("fzf-lua").grep_project()
        end,
        desc = "FZF: Grep project",
    },

    {
        "gd",
        function()
            require("fzf-lua").lsp_definitions()
        end,
        desc = "FZF: LSP definitions",
    },
    {
        "gi",
        function()
            require("fzf-lua").lsp_implementations()
        end,
        desc = "FZF: LSP implementations",
    },
    {
        "<leader>ca",
        function()
            require("fzf-lua").lsp_code_actions()
        end,
        desc = "FZF: LSP code actions",
    },
    {
        "<leader>h",
        function()
            require("fzf-lua").search_history()
        end,
        desc = "FZF: Search history",
    },
    {
        "<leader>ch",
        function()
            require("fzf-lua").command_history()
        end,
        desc = "FZF: Command history",
    },

    { "<leader>sc", false },
    { "gr",         false },
}

return {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = fzf_keymap,
    opts = fzf_opts,
    config = function(_, opts)
        local ok, fzf = pcall(require, "fzf-lua")
        if not ok then
            return
        end
        fzf.setup(opts)
        fzf.register_ui_select()
    end,
}
