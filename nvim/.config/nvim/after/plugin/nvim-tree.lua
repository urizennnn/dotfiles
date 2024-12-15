vim.cmd([[
    highlight NvimTreeFolderIcon guifg=#FFFF00
    highlight NvimTreeOpenedFolderIcon guifg=#c6d0f5
    highlight NvimTreeEmptyFolderName guifg=#c6d0f5
    highlight NvimTreeOpenedFolderName guifg=#c6d0f5
    highlight NvimTreeFolderName guifg=#c6d0f5
]])

require(***REMOVED***nvim-tree***REMOVED***).setup({
	update_focused_***REMOVED***le = {
		enable = true, -- Enables the sync with the current ***REMOVED***le
		update_cwd = true, -- Updates the current working directory
		ignore_list = {}, -- Files or folders to ignore for this feature
	},
	sort = {
		sorter = ***REMOVED***case_sensitive***REMOVED***,
	},
	view = {
		centralize_selection = false,
		cursorline = true,
		debounce_delay = 15,
		side = ***REMOVED***left***REMOVED***,
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = ***REMOVED***yes***REMOVED***,
		adaptive_size = true,
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_con***REMOVED***g = {
				relative = ***REMOVED***editor***REMOVED***,
				border = ***REMOVED***rounded***REMOVED***,
				width = 30,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},
	renderer = {
		group_empty = true,
		icons = {
			web_devicons = {
				***REMOVED***le = {
					enable = true,
					color = true,
				},
				folder = {
					enable = true,
					color = true,
				},
			},
			glyphs = {
				default = ***REMOVED******REMOVED***,
				symlink = ***REMOVED******REMOVED***,
				bookmark = ***REMOVED***󰆤***REMOVED***,
				modi***REMOVED***ed = ***REMOVED***●***REMOVED***,
				folder = {
					arrow_closed = ***REMOVED******REMOVED***,
					arrow_open = ***REMOVED******REMOVED***,
					default = ***REMOVED******REMOVED***,
					open = ***REMOVED******REMOVED***,
					empty = ***REMOVED******REMOVED***,
					empty_open = ***REMOVED******REMOVED***,
					symlink = ***REMOVED******REMOVED***,
					symlink_open = ***REMOVED******REMOVED***,
				},
			},
		},
	},
	***REMOVED***lters = {
		dot***REMOVED***les = false,
		git_ignored = false,
	},
})
