local npairs = require(***REMOVED***nvim-autopairs***REMOVED***)
local Rule = require(***REMOVED***nvim-autopairs.rule***REMOVED***)

npairs.setup({
	check_ts = true,
	ts_con***REMOVED***g = {
		lua = { ***REMOVED***string***REMOVED*** },
		javascript = { ***REMOVED***template_string***REMOVED*** },
		java = false,
	},
	enable_check_bracket_line = true,
})

local ts_conds = require(***REMOVED***nvim-autopairs.ts-conds***REMOVED***)

npairs.add_rules({
	Rule(***REMOVED***%***REMOVED***, ***REMOVED***%***REMOVED***, ***REMOVED***lua***REMOVED***):with_pair(ts_conds.is_ts_node({ ***REMOVED***string***REMOVED***, ***REMOVED***comment***REMOVED*** })),
	Rule(***REMOVED***$***REMOVED***, ***REMOVED***$***REMOVED***, ***REMOVED***lua***REMOVED***):with_pair(ts_conds.is_not_ts_node({ ***REMOVED***function***REMOVED*** })),
	Rule(***REMOVED***<***REMOVED***, ***REMOVED***>***REMOVED***, ***REMOVED***rust***REMOVED***),
	Rule(***REMOVED***<***REMOVED***, ***REMOVED***>***REMOVED***, ***REMOVED***typescript***REMOVED***),
	Rule(***REMOVED***<***REMOVED***, ***REMOVED***>***REMOVED***, ***REMOVED***javascript***REMOVED***),
	Rule(***REMOVED***|***REMOVED***, ***REMOVED***|***REMOVED***, ***REMOVED***rust***REMOVED***),
	Rule(***REMOVED***<***REMOVED***, ***REMOVED***>***REMOVED***, ***REMOVED***lua***REMOVED***):with_pair(ts_conds.is_not_ts_node({ ***REMOVED***function***REMOVED***, ***REMOVED***string***REMOVED*** })),
	Rule(***REMOVED***<***REMOVED***, ***REMOVED***>***REMOVED***, ***REMOVED***html***REMOVED***),
})
