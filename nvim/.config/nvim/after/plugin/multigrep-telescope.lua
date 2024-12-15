local pickers = require(***REMOVED***telescope.pickers***REMOVED***)
local conf = require(***REMOVED***telescope.con***REMOVED***g***REMOVED***).values
local make_entry = require(***REMOVED***telescope.make_entry***REMOVED***)
local ***REMOVED***nders = require(***REMOVED***telescope.***REMOVED***nders***REMOVED***)
local M = {}

local mgrep = function(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.fn.getcwd()
	local ***REMOVED***nder = ***REMOVED***nders.new_async_job({
		command_generator = function(prompt)
			if not prompt or prompt == ***REMOVED******REMOVED*** then
				return nil
			end
			local pieces = vim.split(prompt, ***REMOVED***  ***REMOVED***)
			local args = { ***REMOVED***rg***REMOVED*** }
			if pieces[1] then
				table.insert(args, ***REMOVED***-e***REMOVED***)
				table.insert(args, pieces[1])
			end

			if pieces[2] then
				table.insert(args, ***REMOVED***-g***REMOVED***)
				table.insert(args, pieces[2])
			end
			---@diagnostic disable-next-line:  deprecated
			return vim.tbl_flatten({
				args,
				***REMOVED***--color=never***REMOVED***,
				***REMOVED***--no-heading***REMOVED***,
				***REMOVED***--with-***REMOVED***lename***REMOVED***,
				***REMOVED***--line-number***REMOVED***,
				***REMOVED***--column***REMOVED***,
				***REMOVED***--smart-case***REMOVED***,
				***REMOVED***--hidden***REMOVED***,
			})
		end,
		entry_maker = make_entry.gen_from_vimgrep(opts),
		cwd = opts.cwd,
	})
	pickers
		.new(opts, {
			***REMOVED***nder = ***REMOVED***nder,
			prompt_title = ***REMOVED***My custom multi grep***REMOVED***,
			previewer = conf.grep_previewer(opts),
			sorter = require(***REMOVED***telescope.sorters***REMOVED***).empty(),
		})
		:***REMOVED***nd()
end
M.setup = function()
	mgrep()
end

vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***mg***REMOVED***, mgrep)
return M
