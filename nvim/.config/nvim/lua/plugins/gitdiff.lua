return {
  { "tpope/vim-fugitive" },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>dv", "<cmd>DiffviewOpen<cr>", desc = "DiffView Open" },
      { "<leader>dx", "<cmd>DiffviewClose<cr>", desc = "DiffView Close" },
      { "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
    },
    opts = {},
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true, -- default mappings:
    -- ]x / [x jump conflicts;  co = ours, ct = theirs, cb = both, c0 = none
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(buf)
        local gs = package.loaded.gitsigns
        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = buf, desc = "Stage hunk" })
        vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = buf, desc = "Unstage hunk" })
        vim.keymap.set("n", "<leader>hb", gs.blame_line, { buffer = buf, desc = "Blame line" })
      end,
    },
  },
}
