require(***REMOVED***dashboard***REMOVED***).setup({
	hide = {
		statusline = false,
	},
	con***REMOVED***g = {
		header = {
			[[]],
			[[UUUUUUUU     UUUUUUUURRRRRRRRRRRRRRRRR   IIIIIIIIIIZZZZZZZZZZZZZZZZZZZEEEEEEEEEEEEEEEEEEEEEENNNNNNNN        NNNNNNNN]],
			[[U::::::U     U::::::UR::::::::::::::::R  I::::::::IZ:::::::::::::::::ZE::::::::::::::::::::EN:::::::N       N::::::N]],
			[[U::::::U     U::::::UR::::::RRRRRR:::::R I::::::::IZ:::::::::::::::::ZE::::::::::::::::::::EN::::::::N      N::::::N]],
			[[UU:::::U     U:::::UURR:::::R     R:::::RII::::::IIZ:::ZZZZZZZZ:::::Z EE::::::EEEEEEEEE::::EN:::::::::N     N::::::N]],
			[[ U:::::U     U:::::U   R::::R     R:::::R  I::::I  ZZZZZ     Z:::::Z    E:::::E       EEEEEEN::::::::::N    N::::::N]],
			[[ U:::::D     D:::::U   R::::R     R:::::R  I::::I          Z:::::Z      E:::::E             N:::::::::::N   N::::::N]],
			[[ U:::::D     D:::::U   R::::RRRRRR:::::R   I::::I         Z:::::Z       E::::::EEEEEEEEEE   N:::::::N::::N  N::::::N]],
			[[ U:::::D     D:::::U   R:::::::::::::RR    I::::I        Z:::::Z        E:::::::::::::::E   N::::::N N::::N N::::::N]],
			[[ U:::::D     D:::::U   R::::RRRRRR:::::R   I::::I       Z:::::Z         E:::::::::::::::E   N::::::N  N::::N:::::::N]],
			[[ U:::::D     D:::::U   R::::R     R:::::R  I::::I      Z:::::Z          E::::::EEEEEEEEEE   N::::::N   N:::::::::::N]],
			[[ U:::::D     D:::::U   R::::R     R:::::R  I::::I     Z:::::Z           E:::::E             N::::::N    N::::::::::N]],
			[[ U::::::U   U::::::U   R::::R     R:::::R  I::::I  ZZZ:::::Z     ZZZZZ  E:::::E       EEEEEEN::::::N     N:::::::::N]],
			[[ U:::::::UUU:::::::U RR:::::R     R:::::RII::::::IIZ::::::ZZZZZZZZ:::ZEE::::::EEEEEEEE:::::EN::::::N      N::::::::N]],
			[[  UU:::::::::::::UU  R::::::R     R:::::RI::::::::IZ:::::::::::::::::ZE::::::::::::::::::::EN::::::N       N:::::::N]],
			[[    UU:::::::::UU    R::::::R     R:::::RI::::::::IZ:::::::::::::::::ZE::::::::::::::::::::EN::::::N        N::::::N]],
			[[      UUUUUUUUU      RRRRRRRR     RRRRRRRIIIIIIIIIIZZZZZZZZZZZZZZZZZZZEEEEEEEEEEEEEEEEEEEEEENNNNNNNN         NNNNNNN]],
			[[]],
		},
		center = {
			{ action = ***REMOVED***ene | startinsert***REMOVED***, desc = ***REMOVED***New File***REMOVED***, icon = ***REMOVED*** ***REMOVED***, key = ***REMOVED***n***REMOVED*** },
			{ action = ***REMOVED***Lazy***REMOVED***, desc = ***REMOVED***Lazy***REMOVED***, icon = ***REMOVED***󰒲 ***REMOVED***, key = ***REMOVED***l***REMOVED*** },
			{ action = ***REMOVED***Telescope old***REMOVED***les***REMOVED***, desc = ***REMOVED***Old ***REMOVED***les***REMOVED***, icon = ***REMOVED*** ***REMOVED***, key = ***REMOVED***o***REMOVED*** },
			{
				action = function()
					vim.api.nvim_input(***REMOVED***<cmd>qa<cr>***REMOVED***)
				end,
				desc = ***REMOVED***Quit***REMOVED***,
				icon = ***REMOVED*** ***REMOVED***,
				key = ***REMOVED***q***REMOVED***,
			},
		},
		footer = function()
			local stats = require(***REMOVED***lazy***REMOVED***).stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			return { ***REMOVED***⚡ Neovim loaded ***REMOVED*** .. stats.loaded .. ***REMOVED***/***REMOVED*** .. stats.count .. ***REMOVED*** plugins in ***REMOVED*** .. ms .. ***REMOVED***ms***REMOVED*** }
		end,
	},
})
