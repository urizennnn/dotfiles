function InsertTryCatch()
	local line = vim.api.nvim_get_current_line()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local new_lines = {
		***REMOVED***try {***REMOVED***,
		***REMOVED***    ***REMOVED*** .. line,
		***REMOVED***} catch (error) {***REMOVED***,
		***REMOVED***    console.error(error);***REMOVED***,
		***REMOVED***	 return res.status().json({});***REMOVED***,
		***REMOVED***}***REMOVED***,
	}
	local current_line_number = cursor_pos[1] - 1
	vim.api.nvim_buf_set_lines(0, current_line_number, current_line_number + 1, false, new_lines)
end

function InsertTryCatchVisual()
	local start_line, _, end_line, _ = unpack(vim.fn.getpos(***REMOVED***'<***REMOVED***)), unpack(vim.fn.getpos(***REMOVED***'>***REMOVED***))
	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

	table.insert(lines, 1, ***REMOVED***try {***REMOVED***)
	table.insert(lines, ***REMOVED***} catch (error) {***REMOVED***)
	table.insert(lines, ***REMOVED***    console.error(error);***REMOVED***)
	table.insert(lines, ***REMOVED***}***REMOVED***)

	vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)
end
function InsertConsoleLog()
	local line = vim.api.nvim_get_current_line()
	local new_line = string.format(***REMOVED***console.log(`${%s}`);***REMOVED***, line)
	vim.api.nvim_set_current_line(new_line)
end
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***cl***REMOVED***, InsertConsoleLog, { noremap = true })
vim.keymap.set(***REMOVED***v***REMOVED***, ***REMOVED***cl***REMOVED***, InsertConsoleLog, { noremap = true })
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***try***REMOVED***, InsertTryCatch, { noremap = true })
vim.keymap.set(***REMOVED***v***REMOVED***, ***REMOVED***try***REMOVED***, InsertTryCatchVisual, { noremap = true })
