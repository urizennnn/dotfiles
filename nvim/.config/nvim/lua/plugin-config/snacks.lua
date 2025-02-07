local opts = {
	big***REMOVED***le = {
		enabled = true,
		setup = function(ctx)
			vim.b.minianimate_disable = true
			vim.schedule(function()
				vim.bo[ctx.buf].syntax = ctx.ft
			end)
		end,
	},
	noti***REMOVED***er = {
		timeout = 3000, -- default timeout in ms
		width = { min = 40, max = 0.4 },
		height = { min = 1, max = 0.6 },
		-- editor margin to keep free. tabline and statusline are taken into account automatically
		margin = { top = 0, right = 1, bottom = 0 },
		padding = true, -- add 1 cell of left/right padding to the noti***REMOVED***cation window
		sort = { ***REMOVED***level***REMOVED***, ***REMOVED***added***REMOVED*** }, -- sort by level and time
		icons = {
			error = ***REMOVED*** ***REMOVED***,
			warn = ***REMOVED*** ***REMOVED***,
			info = ***REMOVED*** ***REMOVED***,
			debug = ***REMOVED*** ***REMOVED***,
			trace = ***REMOVED*** ***REMOVED***,
		},
		---@type snacks.noti***REMOVED***er.style
		style = ***REMOVED***compact***REMOVED***,
		top_down = true, -- place noti***REMOVED***cations from top to bottom
		date_format = ***REMOVED***%R***REMOVED***, -- time format for noti***REMOVED***cations
		refresh = 50, -- refresh at most every 50ms
	},
	quick***REMOVED***le = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		noti***REMOVED***cation = {
			wo = { wrap = true }, -- Wrap noti***REMOVED***cations
		},
	},
}

opts.keys = {
	{
		***REMOVED***<leader>un***REMOVED***,
		function()
			Snacks.noti***REMOVED***er.hide()
		end,
		desc = ***REMOVED***Dismiss All Noti***REMOVED***cations***REMOVED***,
	},
	{
		***REMOVED***<leader>bd***REMOVED***,
		function()
			Snacks.bufdelete()
		end,
		desc = ***REMOVED***Delete Buffer***REMOVED***,
	},
	{
		***REMOVED***<leader>gb***REMOVED***,
		desc = ***REMOVED***Git Blame Line***REMOVED***,
	},
	{
		***REMOVED***<leader>gB***REMOVED***,
		function()
			Snacks.gitbrowse()
		end,
		desc = ***REMOVED***Git Browse***REMOVED***,
	},

	{
		***REMOVED***<leader>gl***REMOVED***,
		function()
			Snacks.lazygit.log()
		end,
		desc = ***REMOVED***Lazygit Log (cwd)***REMOVED***,
	},
	{
		***REMOVED***<leader>R***REMOVED***,
		function()
			Snacks.rename()
		end,
		desc = ***REMOVED***Rename File***REMOVED***,
	},

	{
		***REMOVED***]]***REMOVED***,
		function()
			Snacks.words.jump(vim.v.count1)
		end,
		desc = ***REMOVED***Next Reference***REMOVED***,
		mode = { ***REMOVED***n***REMOVED***, ***REMOVED***t***REMOVED*** },
	},
	{
		***REMOVED***[[***REMOVED***,
		function()
			Snacks.words.jump(-vim.v.count1)
		end,
		desc = ***REMOVED***Prev Reference***REMOVED***,
		mode = { ***REMOVED***n***REMOVED***, ***REMOVED***t***REMOVED*** },
	},
	{
		***REMOVED***<leader>N***REMOVED***,
		desc = ***REMOVED***Neovim News***REMOVED***,
		function()
			Snacks.win({
				***REMOVED***le = vim.api.nvim_get_runtime_***REMOVED***le(***REMOVED***doc/news.txt***REMOVED***, false)[1],
				width = 0.6,
				height = 0.6,
				wo = {
					spell = false,
					wrap = false,
					signcolumn = ***REMOVED***yes***REMOVED***,
					statuscolumn = ***REMOVED*** ***REMOVED***,
					conceallevel = 3,
				},
			})
		end,
	},
}
return opts
