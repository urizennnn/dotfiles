vim.api.nvim_create_autocmd({ ***REMOVED***InsertLeave***REMOVED***, ***REMOVED***TextChanged***REMOVED*** }, {
	group = vim.api.nvim_create_augroup(***REMOVED***AutoSave***REMOVED***, { clear = true }),
	pattern = ***REMOVED*******REMOVED***,
	callback = function()
		vim.cmd(***REMOVED***silent! wa***REMOVED***)
	end,
})
