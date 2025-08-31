return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neoivim](https://github.com/neovim/neovim)
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = { italic = true },
                variables = { italic = true },
                sidebars = "transparent", -- style for sidebars, see below
                floats = "transparent", -- style for floating windows
            },
            sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = true,       -- dims inactive windows
            lualine_bold = false,      -- When `true`, section headers in the lualine theme will be bold

            cache = true,
            on_colors = function(colors)
                colors.hint = colors.orange
            end,
            plugins = {
                all = package.loaded.lazy == nil,
                auto = true,
            },
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight")
        end,
    },
}
