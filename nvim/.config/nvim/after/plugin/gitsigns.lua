require(***REMOVED***gitsigns***REMOVED***).setup({
	signs = {
		add = { text = ***REMOVED***+***REMOVED*** },
		change = { text = ***REMOVED***~***REMOVED*** },
		delete = { text = ***REMOVED***_***REMOVED*** },
		topdelete = { text = ***REMOVED***‾***REMOVED*** },
		changedelete = { text = ***REMOVED***~***REMOVED*** },
		untracked = { text = ***REMOVED***┆***REMOVED*** },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_***REMOVED***les = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = ***REMOVED***overlay***REMOVED***, -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = ***REMOVED***<author>, <author_time:%Y-%m-%d> - <summary>***REMOVED***,
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_***REMOVED***le_length = 40000, -- Disable if ***REMOVED***le is longer than this (in lines)
	preview_con***REMOVED***g = {
		-- Options passed to nvim_open_win
		border = ***REMOVED***single***REMOVED***,
		style = ***REMOVED***minimal***REMOVED***,
		relative = ***REMOVED***cursor***REMOVED***,
		row = 0,
		col = 1,
	},
})
