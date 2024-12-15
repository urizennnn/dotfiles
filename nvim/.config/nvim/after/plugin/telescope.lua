local builtin = require(***REMOVED***telescope.builtin***REMOVED***)
local telescope = require(***REMOVED***telescope***REMOVED***)

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			***REMOVED***rg***REMOVED***,
			***REMOVED***--color=never***REMOVED***,
			***REMOVED***--no-heading***REMOVED***,
			***REMOVED***--with-***REMOVED***lename***REMOVED***,
			***REMOVED***--line-number***REMOVED***,
			***REMOVED***--column***REMOVED***,
			***REMOVED***--smart-case***REMOVED***,
			***REMOVED***--hidden***REMOVED***,
			***REMOVED***--no-ignore***REMOVED***,
			***REMOVED***--glob***REMOVED***,
			***REMOVED***!.git/****REMOVED***,
		},
		prompt_pre***REMOVED***x = ***REMOVED***🔍 ***REMOVED***,
		selection_caret = ***REMOVED***❯ ***REMOVED***,
		entry_pre***REMOVED***x = ***REMOVED***  ***REMOVED***,
		initial_mode = ***REMOVED***insert***REMOVED***,
		selection_strategy = ***REMOVED***reset***REMOVED***,
		sorting_strategy = ***REMOVED***descending***REMOVED***,
		layout_strategy = ***REMOVED***horizontal***REMOVED***,
		layout_con***REMOVED***g = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		***REMOVED***le_sorter = require(***REMOVED***telescope.sorters***REMOVED***).get_fzy_sorter,
		***REMOVED***le_ignore_patterns = {},
		generic_sorter = require(***REMOVED***telescope.sorters***REMOVED***).get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { ***REMOVED***─***REMOVED***, ***REMOVED***│***REMOVED***, ***REMOVED***─***REMOVED***, ***REMOVED***│***REMOVED***, ***REMOVED***┌***REMOVED***, ***REMOVED***┐***REMOVED***, ***REMOVED***┘***REMOVED***, ***REMOVED***└***REMOVED*** },
		color_devicons = true,
		use_less = true,
		set_env = { [***REMOVED***COLORTERM***REMOVED***] = ***REMOVED***truecolor***REMOVED*** },
		***REMOVED***le_previewer = require(***REMOVED***telescope.previewers***REMOVED***).vim_buffer_cat.new,
		grep_previewer = require(***REMOVED***telescope.previewers***REMOVED***).vim_buffer_vimgrep.new,
		qflist_previewer = require(***REMOVED***telescope.previewers***REMOVED***).vim_buffer_qflist.new,
		***REMOVED***nd_command = {
			***REMOVED***fd***REMOVED***,
			***REMOVED***--type***REMOVED***,
			***REMOVED***f***REMOVED***,
			***REMOVED***--hidden***REMOVED***,
			***REMOVED***--no-ignore-vcs***REMOVED***,
			***REMOVED***--follow***REMOVED***,
			***REMOVED***--exclude***REMOVED***,
			***REMOVED***.git***REMOVED***,
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_***REMOVED***le_sorter = true,
		},
	},
})

vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<C-p>***REMOVED***, builtin.git_***REMOVED***les, {})
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>ps***REMOVED***, function()
	local result = vim.fn.input(***REMOVED***Grep > ***REMOVED***)
	if result ~= ***REMOVED******REMOVED*** then
		builtin.grep_string({ search = result })
	***REMOVED***
		print(***REMOVED***No input***REMOVED***)
	end
end)
