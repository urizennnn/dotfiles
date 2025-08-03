local harpoon = require("harpoon")
harpoon:setup({
	global_settings = {
		save_on_toggle = true,
		save_on_change = true,
	},
})

local fzf = require("fzf-lua")
local actions = require("fzf-lua.actions")

local function toggle_harpoon_fzf()
	-- collect the file paths from Harpoon’s list
	local items = harpoon:list().items
	local file_paths = {}
	for _, item in ipairs(items) do
		table.insert(file_paths, item.value)
	end

	-- launch fzf-lua with a custom source and open on selection
	fzf.fzf({
		source = file_paths,
		sink = actions.file_edit,
		prompt = "Harpoon> ",
	})
end

-- Keymaps
vim.keymap.set("n", "<C-e>", toggle_harpoon_fzf, { desc = "Open Harpoon fzf window" })
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Harpoon: add file" })
vim.keymap.set("n", "<Alt>d", function()
	harpoon:list():remove_at()
end, { desc = "Harpoon: remove file" })
vim.keymap.set("n", "<C-h>", function()
	harpoon:list():select(1)
end, { desc = "Harpoon: go to mark 1" })
vim.keymap.set("n", "<C-t>", function()
	harpoon:list():select(2)
end, { desc = "Harpoon: go to mark 2" })
vim.keymap.set("n", "<C-n>", function()
	harpoon:list():select(3)
end, { desc = "Harpoon: go to mark 3" })
vim.keymap.set("n", "<C-s>", function()
	harpoon:list():select(4)
end, { desc = "Harpoon: go to mark 4" })

-- Navigate Harpoon marks forward/backward
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end, { desc = "Harpoon: previous mark" })
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end, { desc = "Harpoon: next mark" })
