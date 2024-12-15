local harpoon = require(***REMOVED***harpoon***REMOVED***)
harpoon:setup({
	global_settings = {
		save_on_toggle = true,
		save_on_change = true,
	},
})

-- basic telescope con***REMOVED***guration
local conf = require(***REMOVED***telescope.con***REMOVED***g***REMOVED***).values
-- local function toggle_telescope(harpoon_***REMOVED***les)
-- 	local ***REMOVED***le_paths = {}
-- 	for _, item in ipairs(harpoon_***REMOVED***les.items) do
-- 		table.insert(***REMOVED***le_paths, item.value)
-- 	end
--
-- 	require(***REMOVED***telescope.pickers***REMOVED***)
-- 		.new({}, {
-- 			prompt_title = ***REMOVED***Harpoon***REMOVED***,
-- 			***REMOVED***nder = require(***REMOVED***telescope.***REMOVED***nders***REMOVED***).new_table({
-- 				results = ***REMOVED***le_paths,
-- 			}),
-- 			previewer = conf.***REMOVED***le_previewer({}),
-- 			sorter = conf.generic_sorter({}),
-- 		})
-- 		:***REMOVED***nd()
-- end
--
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<C-e>***REMOVED***, function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = ***REMOVED***Open harpoon window***REMOVED*** })
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>a***REMOVED***, function()
	harpoon:list():add()
end)
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<Alt>d***REMOVED***, function()
	harpoon:list():remove_at()
end)
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<C-h>***REMOVED***, function()
	harpoon:list():select(1)
end)
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<C-t>***REMOVED***, function()
	harpoon:list():select(2)
end)
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<C-n>***REMOVED***, function()
	harpoon:list():select(3)
end)
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<C-s>***REMOVED***, function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<C-S-P>***REMOVED***, function()
	harpoon:list():prev()
end)
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<C-S-N>***REMOVED***, function()
	harpoon:list():next()
end)
