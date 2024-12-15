local notify = require(***REMOVED***notify***REMOVED***)

notify(***REMOVED***Welcome back Urizen***REMOVED***)

vim.notify = notify
notify.setup({
	-- Animation style (see below for details)
	animation_style = ***REMOVED***ease***REMOVED***,
	max_width = 80,
	max_height = 15,
	on_open = function()
		vim.cmd(***REMOVED***mode***REMOVED***)
	end,
	on_close = function()
		vim.cmd(***REMOVED***mode***REMOVED***)
	end,
	background_colour = ***REMOVED***NotifyBackground***REMOVED***,
	fps = 30,
	icons = {
		DEBUG = ***REMOVED******REMOVED***,
		ERROR = ***REMOVED******REMOVED***,
		INFO = ***REMOVED******REMOVED***,
		TRACE = ***REMOVED***✎***REMOVED***,
		WARN = ***REMOVED******REMOVED***,
	},
	level = 2,
	minimum_width = 50,
	render = ***REMOVED***default***REMOVED***,
	stages = ***REMOVED***fade_in_slide_out***REMOVED***,
	time_formats = {
		noti***REMOVED***cation = ***REMOVED***%T***REMOVED***,
		noti***REMOVED***cation_history = ***REMOVED***%FT%T***REMOVED***,
	},
	timeout = 5000,
	top_down = true,
})
