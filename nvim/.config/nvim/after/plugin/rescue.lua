local status, lsp = pcall(require, ***REMOVED***rescue-lsp***REMOVED***)
if not status then
	vim.notify(***REMOVED***Failed to load rescue-lsp: ***REMOVED*** .. lsp, vim.log.levels.ERROR)
	return
end

lsp.setup({
	Lsp = {
		commands_override = false,
		-- ***REMOVED***nd_lsp_servers = function() end,
	},
	window = {
		-- win_height = 30,
		-- win_width = 170,
		-- win_row = 10,
		-- win_col = 35,
		-- border = ***REMOVED***rounded***REMOVED***,
		-- relative = ***REMOVED***editor***REMOVED***,
	},
})
