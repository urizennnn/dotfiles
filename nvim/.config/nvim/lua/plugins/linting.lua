return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}

      local function remove_dotenv_linter(ft)
        local linters = opts.linters_by_ft[ft]
        if not linters then
          return
        end

        opts.linters_by_ft[ft] = vim.tbl_filter(function(name)
          return name ~= "dotenv_linter"
        end, linters)
      end

      remove_dotenv_linter("dotenv")
      remove_dotenv_linter("sh")
    end,
  },
}
