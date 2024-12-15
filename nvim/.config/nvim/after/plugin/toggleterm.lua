require(***REMOVED***toggleterm***REMOVED***).setup({
	size = 20,
	open_mapping = [[<C-n>]],
	hide_numbers = true,
	shade_***REMOVED***letypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	persist_size = true,
	direction = ***REMOVED***float***REMOVED***,
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = ***REMOVED***curved***REMOVED***,
		winblend = 0,
		highlights = {
			border = ***REMOVED***Normal***REMOVED***,
			background = ***REMOVED***Normal***REMOVED***,
		},
	},
	winbar = {
		enabled = false,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
})

local Terminal = require(***REMOVED***toggleterm.terminal***REMOVED***).Terminal

local node = Terminal:new({ cmd = ***REMOVED***node***REMOVED***, hidden = true })
function _NODE_TOGGLE()
	node:toggle()
end

local htop = Terminal:new({ cmd = ***REMOVED***htop***REMOVED***, hidden = true })

function _HTOP_TOGGLE()
	htop:toggle()
end

vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***ht***REMOVED***, ***REMOVED***:lua _HTOP_TOGGLE()<CR>***REMOVED***, { silent = true })
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***node***REMOVED***, ***REMOVED***:lua _NODE_TOGGLE()<CR>***REMOVED***, { silent = true })
