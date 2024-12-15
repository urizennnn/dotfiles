require(***REMOVED***noice***REMOVED***).setup({
	cmdline = {
		enabled = true,
		view = ***REMOVED***cmdline_popup***REMOVED***,
		format = {
			cmdline = { pattern = ***REMOVED***^:***REMOVED***, icon = ***REMOVED******REMOVED***, lang = ***REMOVED***vim***REMOVED*** },
			search_down = { kind = ***REMOVED***search***REMOVED***, pattern = ***REMOVED***^/***REMOVED***, icon = ***REMOVED*** ***REMOVED***, lang = ***REMOVED***regex***REMOVED*** },
			search_up = { kind = ***REMOVED***search***REMOVED***, pattern = ***REMOVED***^%?***REMOVED***, icon = ***REMOVED*** ***REMOVED***, lang = ***REMOVED***regex***REMOVED*** },
			***REMOVED***lter = { pattern = ***REMOVED***^:%s*!***REMOVED***, icon = ***REMOVED***$***REMOVED***, lang = ***REMOVED***bash***REMOVED*** },
			lua = { pattern = { ***REMOVED***^:%s*lua%s+***REMOVED***, ***REMOVED***^:%s*lua%s*=%s****REMOVED***, ***REMOVED***^:%s*=%s****REMOVED*** }, icon = ***REMOVED******REMOVED***, lang = ***REMOVED***lua***REMOVED*** },
			help = { pattern = ***REMOVED***^:%s*he?l?p?%s+***REMOVED***, icon = ***REMOVED******REMOVED*** },
		},
	},
	messages = {
		enabled = true,
		view = ***REMOVED***notify***REMOVED***,
		view_error = ***REMOVED***notify***REMOVED***,
		view_warn = ***REMOVED***notify***REMOVED***,
		view_history = ***REMOVED***messages***REMOVED***,
		view_search = ***REMOVED***virtualtext***REMOVED***,
	},
	popupmenu = {
		enabled = true,
		backend = ***REMOVED***nui***REMOVED***,
	},
	redirect = {
		view = ***REMOVED***popup***REMOVED***,
		***REMOVED***lter = { event = ***REMOVED***msg_show***REMOVED*** },
	},
	commands = {
		history = {
			view = ***REMOVED***split***REMOVED***,
			opts = { enter = true, format = ***REMOVED***details***REMOVED*** },
			***REMOVED***lter = {
				any = {
					{ event = ***REMOVED***notify***REMOVED*** },
					{ ***REMOVED***nd = ***REMOVED***recording***REMOVED*** },
					{ error = true },
					{ warning = true },
					{ event = ***REMOVED***msg_show***REMOVED***, kind = { ***REMOVED******REMOVED*** } },
					{ event = ***REMOVED***lsp***REMOVED***, kind = ***REMOVED***message***REMOVED*** },
				},
			},
		},
		last = {
			view = ***REMOVED***popup***REMOVED***,
			opts = { enter = true, format = ***REMOVED***details***REMOVED*** },
			***REMOVED***lter = {
				any = {
					{ event = ***REMOVED***notify***REMOVED*** },
					{ error = true },
					{ warning = true },
					{ event = ***REMOVED***msg_show***REMOVED***, kind = { ***REMOVED******REMOVED*** } },
					{ event = ***REMOVED***lsp***REMOVED***, kind = ***REMOVED***message***REMOVED*** },
				},
			},
			***REMOVED***lter_opts = { count = 1 },
		},
		errors = {
			view = ***REMOVED***popup***REMOVED***,
			opts = { enter = true, format = ***REMOVED***details***REMOVED*** },
			***REMOVED***lter = { error = true },
			***REMOVED***lter_opts = { reverse = true },
		},
		all = {
			view = ***REMOVED***split***REMOVED***,
			opts = { enter = true, format = ***REMOVED***details***REMOVED*** },
			***REMOVED***lter = {},
		},
	},
	notify = {
		enabled = true,
		view = ***REMOVED***notify***REMOVED***,
	},
	lsp = {
		progress = {
			enabled = true,
			format = ***REMOVED***lsp_progress***REMOVED***,
			format_done = ***REMOVED***lsp_progress_done***REMOVED***,
			throttle = 1000 / 30,
			view = ***REMOVED***mini***REMOVED***,
		},
		override = {
			[***REMOVED***vim.lsp.util.convert_input_to_markdown_lines***REMOVED***] = false,
			[***REMOVED***vim.lsp.util.stylize_markdown***REMOVED***] = false,
			[***REMOVED***cmp.entry.get_documentation***REMOVED***] = false,
		},
		hover = {
			enabled = true,
			silent = false,
			view = nil,
		},
		signature = {
			enabled = true,
			auto_open = {
				enabled = true,
				trigger = true,
				luasnip = true,
				throttle = 50,
			},
			view = nil,
		},
		message = {
			enabled = true,
			view = ***REMOVED***notify***REMOVED***,
			opts = {},
		},
		documentation = {
			view = ***REMOVED***hover***REMOVED***,
			opts = {
				lang = ***REMOVED***markdown***REMOVED***,
				replace = true,
				render = ***REMOVED***plain***REMOVED***,
				format = { ***REMOVED***{message}***REMOVED*** },
				win_options = { concealcursor = ***REMOVED***n***REMOVED***, conceallevel = 3 },
			},
		},
	},
	markdown = {
		hover = {
			[***REMOVED***|(%S-)|***REMOVED***] = vim.cmd.help,
			[***REMOVED***%[.-%]%((%S-)%)***REMOVED***] = require(***REMOVED***noice.util***REMOVED***).open,
		},
		highlights = {
			[***REMOVED***|%S-|***REMOVED***] = ***REMOVED***@text.reference***REMOVED***,
			[***REMOVED***@%S+***REMOVED***] = ***REMOVED***@parameter***REMOVED***,
			[***REMOVED***^%s*(Parameters:)***REMOVED***] = ***REMOVED***@text.title***REMOVED***,
			[***REMOVED***^%s*(Return:)***REMOVED***] = ***REMOVED***@text.title***REMOVED***,
			[***REMOVED***^%s*(See also:)***REMOVED***] = ***REMOVED***@text.title***REMOVED***,
			[***REMOVED***{%S-}***REMOVED***] = ***REMOVED***@parameter***REMOVED***,
		},
	},
	health = {
		checker = true,
	},
	presets = {
		bottom_search = false,
		command_palette = false,
		long_message_to_split = false,
		inc_rename = false,
		lsp_doc_border = false,
	},
	throttle = 1000 / 30,
	routes = {
		{
			view = ***REMOVED***mini***REMOVED***,
			***REMOVED***lter = {
				event = ***REMOVED***msg_showmode***REMOVED***,
				any = {
					{ ***REMOVED***nd = ***REMOVED***recording***REMOVED*** },
				},
			},
		},
	},
})
