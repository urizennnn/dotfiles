local opts = {
  bigfile = {
    enabled = true,
    setup = function(ctx)
      vim.b.minianimate_disable = true
      vim.schedule(function()
        vim.bo[ctx.buf].syntax = ctx.ft
      end)
    end,
  },

  notifier = {
    timeout = 3000,
    width = { min = 40, max = 0.4 },
    height = { min = 1, max = 0.6 },
    margin = { top = 0, right = 1, bottom = 0 },
    padding = true,
    sort = { "level", "added" },
    icons = {
      error = " ",
      warn = " ",
      info = " ",
      debug = " ",
      trace = " ",
    },
    ---@type snacks.notifier.style
    style = "compact",
    top_down = true,
    date_format = "%R",
    refresh = 50,
  },

  quickfile = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },

  styles = {
    notification = {
      wo = { wrap = true },
    },
  },
}

opts.keys = {
  {
    "<leader>un",
    function()
      Snacks.notifier.hide()
    end,
    desc = "Dismiss All Notifications",
  },
  {
    "<leader>bd",
    function()
      Snacks.bufdelete()
    end,
    desc = "Delete Buffer",
  },
  {
    "<leader>gb",
    function()
      Snacks.git.blame_line()
    end,
    desc = "Git Blame Line",
  },
  {
    "<leader>gB",
    function()
      Snacks.gitbrowse()
    end,
    desc = "Git Browse",
  },
  {
    "<leader>gl",
    function()
      Snacks.lazygit.log()
    end,
    desc = "Lazygit Log (cwd)",
  },
  {
    "<leader>R",
    function()
      Snacks.rename()
    end,
    desc = "Rename File",
  },

  {
    "]]",
    function()
      Snacks.words.jump(vim.v.count1)
    end,
    desc = "Next Reference",
    mode = { "n", "t" },
  },
  {
    "[[",
    function()
      Snacks.words.jump(-vim.v.count1)
    end,
    desc = "Prev Reference",
    mode = { "n", "t" },
  },

  {
    "<leader>N",
    function()
      Snacks.win({
        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
        width = 0.6,
        height = 0.6,
        wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3 },
      })
    end,
    desc = "Neovim News",
  },
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = opts,
  keys = opts.keys,
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Replace old plugin-config helpers with Snacks' built-ins
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd

        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
      end,
    })
  end,
}
