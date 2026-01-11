return {
  -- ═══════════════════════════════════════════════════════════
  -- DISABLE HIGH-MEMORY PLUGINS (saves ~2000+ extmarks)
  -- ═══════════════════════════════════════════════════════════

  -- noice.nvim is the #1 memory consumer (3159 extmarks reported)
  { "folke/noice.nvim", enabled = false },
  { "rcarriga/nvim-notify", enabled = false }, -- dependency of noice

  -- indent-blankline creates 958+ extmarks per buffer
  { "lukas-reineke/indent-blankline.nvim", enabled = false },

  -- mini.indentscope adds 262 extmarks per buffer
  { "echasnovski/mini.indentscope", enabled = false },

  -- vim-illuminate creates many extmarks for word highlighting
  { "RRethy/vim-illuminate", enabled = false },

  -- ═══════════════════════════════════════════════════════════
  -- OPTIMIZE YOUR ENABLED EXTRAS (mini-animate, treesitter-context)
  -- ═══════════════════════════════════════════════════════════

  -- mini.animate: Disable scroll/cursor animations (keep window animations)
  {
    "echasnovski/mini.animate",
    opts = {
      cursor = { enable = false },
      scroll = { enable = false }, -- Major performance gain on large files
      resize = { enable = true },
      open = { enable = true },
      close = { enable = true },
    },
  },

  -- treesitter-context: Reduce from default 3 lines to 2
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 2,
      min_window_height = 20, -- Only show for taller windows
      multiline_threshold = 5,
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- LSP MEMORY MANAGEMENT (Critical for multi-project workflows)
  -- ═══════════════════════════════════════════════════════════

  {
    "Zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      grace_period = 60 * 15, -- Stop LSP clients after 15 min of inactivity
      excluded_lsp_clients = {
        "null-ls",
        "copilot", -- Keep Copilot running
        "gopls", -- Avoid cold-start reindexing
        "lua_ls", -- Lua LSP has issues restarting
      },
      notifications = false,
      retries = 3,
      timeout = 1000,
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- SNACKS.NVIM PERFORMANCE TUNING
  -- ═══════════════════════════════════════════════════════════

  {
    "folke/snacks.nvim",
    opts = {
      -- Disable snacks animations globally
      scroll = { enabled = false },

      -- Keep bigfile enabled (already default in LazyVim)
      bigfile = {
        enabled = true,
        size = 1024 * 1024 * 1.5, -- 1.5 MB threshold
        setup = function(ctx)
          vim.b[ctx.buf].minianimate_disable = true
          vim.schedule(function()
            vim.bo[ctx.buf].syntax = ctx.ft
          end)
        end,
      },

      -- Explorer performance: disable git status computation
      picker = {
        sources = {
          explorer = {
            hidden = false,
            git_status = false, -- Disable for faster loading
            git_status_open = false,
            diagnostics = false, -- Disable inline diagnostics
            diagnostics_open = false,
          },
        },
      },
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- LUALINE OPTIMIZATION (reduce update frequency)
  -- ═══════════════════════════════════════════════════════════

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        refresh = { statusline = 1000 }, -- Update every 1s instead of per-keystroke
      },
    },
  },
}
