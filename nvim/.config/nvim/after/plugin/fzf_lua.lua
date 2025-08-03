local opts = {}
local keymap = {
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
		"gr",
		function()
			require("fzf-lua").lsp_references()
		end,
		desc = "FZF: LSP references",
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
}

return opts, keymap
