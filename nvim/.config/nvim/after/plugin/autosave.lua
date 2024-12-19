local autosave_enabled = true

vim.api.nvim_create_autocmd({ ***REMOVED***InsertLeave***REMOVED***, ***REMOVED***TextChanged***REMOVED*** }, {
	group = vim.api.nvim_create_augroup(***REMOVED***AutoSave***REMOVED***, { clear = true }),
	pattern = ***REMOVED*******REMOVED***,
	callback = function()
		if autosave_enabled then
			vim.cmd(***REMOVED***silent! wa***REMOVED***)
		end
	end,
})

function ToggleAutoSave()
	autosave_enabled = not autosave_enabled
	print(***REMOVED***AutoSave is now ***REMOVED*** .. (autosave_enabled and ***REMOVED***Enabled***REMOVED*** or ***REMOVED***Disabled***REMOVED***))
end

vim.api.nvim_create_user_command(***REMOVED***AutoSave***REMOVED***, ToggleAutoSave, {})
