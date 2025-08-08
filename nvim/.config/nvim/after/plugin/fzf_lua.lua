local fzf_opts = {
	ui_select = { enabled = true }, -- internally calls register_ui_select

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

local function do_fzf_setup()
	local ok, fzf = pcall(require, "fzf-lua")
	if not ok or not fzf or type(fzf.setup) ~= "function" then
		return
	end
	fzf.setup(fzf_opts)
end

pcall(do_fzf_setup)
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyLoad",
	callback = function(ev)
		if ev and ev.data == "fzf-lua" then
			do_fzf_setup()
		end
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

return fzf_opts, fzf_keymap
