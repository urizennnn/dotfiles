return {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
        { "<C-n>", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle Terminal", mode = "n" },
        {
            "ht",
            function()
                _TOGGLETERM_HTOP()
            end,
            desc = "Toggle htop",
            mode = "n",
        },
        {
            "node",
            function()
                _TOGGLETERM_NODE()
            end,
            desc = "Toggle Node REPL",
            mode = "n",
        },
    },
    opts = {
        size = 20,
        open_mapping = [[<C-n>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
        winbar = {
            enabled = false,
            name_formatter = function(term) --  term: Terminal
                return term.name
            end,
        },
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)
        local Terminal = require("toggleterm.terminal").Terminal
        if not _G.__toggleterm_node then
            _G.__toggleterm_node = Terminal:new({ cmd = "node", hidden = true, direction = "float" })
        end
        if not _G.__toggleterm_htop then
            _G.__toggleterm_htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })
        end
        _G._TOGGLETERM_NODE = function()
            _G.__toggleterm_node:toggle()
        end
        _G._TOGGLETERM_HTOP = function()
            _G.__toggleterm_htop:toggle()
        end

        pcall(vim.keymap.del, "t", "<C-n>")
        pcall(vim.keymap.del, "i", "<C-n>")
    end,
}
