local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_terminal(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.7)
	local height = opts.height or math.floor(vim.o.lines * 0.7)
	local col = opts.col or math.floor((vim.o.columns - width) / 2)
	local row = opts.row or math.floor((vim.o.lines - height) / 2)

	local buf = nil
	if vim.api.nvim_buf_is_valid(state.floating.buf) then
		buf = state.floating.buf
	***REMOVED***
		buf = vim.api.nvim_create_buf(false, true)
		state.floating.buf = buf

		-- Set the buffer as unlisted and hidden
		vim.bo[buf].bufhidden = ***REMOVED***wipe***REMOVED***
		vim.bo[buf].buflisted = false
	end

	local win = vim.api.nvim_open_win(buf, true, {
		relative = ***REMOVED***editor***REMOVED***,
		width = width,
		height = height,
		row = row,
		col = col,
		style = ***REMOVED***minimal***REMOVED***,
		border = ***REMOVED***rounded***REMOVED***,
	})
	return { buf = buf, win = win }
end

local function toggle_tem()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_terminal({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= ***REMOVED***terminal***REMOVED*** then
			vim.cmd.term()
		end
	***REMOVED***
		vim.api.nvim_win_hide(state.floating.win)
	end
end

vim.api.nvim_create_user_command(***REMOVED***ScratchTerminal***REMOVED***, toggle_tem, {})
vim.keymap.set({ ***REMOVED***n***REMOVED***, ***REMOVED***t***REMOVED*** }, ***REMOVED***<leader>sc***REMOVED***, toggle_tem, { noremap = true, silent = true })
