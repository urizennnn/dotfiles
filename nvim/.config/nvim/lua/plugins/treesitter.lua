return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "typescript",
        "tsx",
        "javascript",
        "rust",
        "toml",
        "go",
        "lua",
        "vim",
        "vimdoc",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
    opts = {
      max_lines = 3,
      trim_scope = "outer",
    },
  },
}
