require(***REMOVED***todo-comments***REMOVED***).setup({
	signs = true,
	sign_priority = 8,
	keywords = {
		FIX = {
			icon = ***REMOVED*** ***REMOVED***,
			color = ***REMOVED***error***REMOVED***,
			alt = { ***REMOVED***FIXME***REMOVED***, ***REMOVED***BUG***REMOVED***, ***REMOVED***FIXIT***REMOVED***, ***REMOVED***ISSUE***REMOVED*** },
		},
		TODO = {
			icon = ***REMOVED*** ***REMOVED***,
			color = ***REMOVED***info***REMOVED***,
		},
		HACK = { icon = ***REMOVED*** ***REMOVED***, color = ***REMOVED***warning***REMOVED*** },
		WARN = { icon = ***REMOVED*** ***REMOVED***, color = ***REMOVED***warning***REMOVED***, alt = { ***REMOVED***WARNING***REMOVED***, ***REMOVED***XXX***REMOVED*** } },
		PERF = { icon = ***REMOVED*** ***REMOVED***, alt = { ***REMOVED***OPTIM***REMOVED***, ***REMOVED***PERFORMANCE***REMOVED***, ***REMOVED***OPTIMIZE***REMOVED*** } },
		NOTE = {
			icon = ***REMOVED*** ***REMOVED***,
			color = ***REMOVED***hint***REMOVED***,
			alt = { ***REMOVED***INFO***REMOVED*** },
		},
		TEST = {
			icon = ***REMOVED*** ***REMOVED***,
			color = ***REMOVED***test***REMOVED***,
			alt = { ***REMOVED***TESTING***REMOVED***, ***REMOVED***PASSED***REMOVED***, ***REMOVED***FAILED***REMOVED*** },
		},
		gui_style = {
			fg = ***REMOVED***NONE***REMOVED***,
			bg = ***REMOVED***BOLD***REMOVED***,
		},
	},
	merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	-- highlighting of the line containing the todo comment
	-- * before: highlights before the keyword (typically comment characters)
	-- * keyword: highlights of the keyword
	-- * after: highlights after the keyword (todo text)
	highlight = {
		multiline = true, -- enable multine todo comments
		multiline_pattern = ***REMOVED***^.***REMOVED***, -- lua pattern to match the next multiline from the start of the matched keyword
		multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
		before = ***REMOVED******REMOVED***, -- ***REMOVED***fg***REMOVED*** or ***REMOVED***bg***REMOVED*** or empty
		keyword = ***REMOVED***wide***REMOVED***, -- ***REMOVED***fg***REMOVED***, ***REMOVED***bg***REMOVED***, ***REMOVED***wide***REMOVED***, ***REMOVED***wide_bg***REMOVED***, ***REMOVED***wide_fg***REMOVED*** or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
		after = ***REMOVED***fg***REMOVED***, -- ***REMOVED***fg***REMOVED*** or ***REMOVED***bg***REMOVED*** or empty
		pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
		comments_only = true, -- uses treesitter to match keywords in comments only
		max_line_len = 400, -- ignore lines longer than this
		exclude = {}, -- list of ***REMOVED***le types to exclude highlighting
	},
	-- list of named colors where we try to extract the guifg from the
	-- list of highlight groups or use the hex color if hl not found as a fallback
	colors = {
		error = { ***REMOVED***DiagnosticError***REMOVED***, ***REMOVED***ErrorMsg***REMOVED***, ***REMOVED***#DC2626***REMOVED*** },
		warning = { ***REMOVED***DiagnosticWarn***REMOVED***, ***REMOVED***WarningMsg***REMOVED***, ***REMOVED***#FBBF24***REMOVED*** },
		info = { ***REMOVED***DiagnosticInfo***REMOVED***, ***REMOVED***#2563EB***REMOVED*** },
		hint = { ***REMOVED***DiagnosticHint***REMOVED***, ***REMOVED***#10B981***REMOVED*** },
		default = { ***REMOVED***Identi***REMOVED***er***REMOVED***, ***REMOVED***#7C3AED***REMOVED*** },
		test = { ***REMOVED***Identi***REMOVED***er***REMOVED***, ***REMOVED***#FF00FF***REMOVED*** },
	},
	search = {
		command = ***REMOVED***rg***REMOVED***,
		args = {
			***REMOVED***--color=never***REMOVED***,
			***REMOVED***--no-heading***REMOVED***,
			***REMOVED***--with-***REMOVED***lename***REMOVED***,
			***REMOVED***--line-number***REMOVED***,
			***REMOVED***--column***REMOVED***,
		},
		-- regex that will be used to match keywords.
		-- don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
})
