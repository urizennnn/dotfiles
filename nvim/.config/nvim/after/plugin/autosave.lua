local autosave_enabled = true

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	group = vim.api.nvim_create_augroup("AutoSave", { clear = true }),
	pattern = "*",
	callback = function()
		if autosave_enabled then
			vim.cmd("silent! wa")
		end
	end,
})

function ToggleAutoSave()
	autosave_enabled = not autosave_enabled
	print("AutoSave is now " .. (autosave_enabled and "Enabled" or "Disabled"))
end

vim.api.nvim_create_user_command("AutoSave", ToggleAutoSave, {})
