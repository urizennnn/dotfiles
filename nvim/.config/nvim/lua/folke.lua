require(***REMOVED***tokyonight***REMOVED***).setup({
	style = ***REMOVED***night***REMOVED***,
	transparent = false, -- Enable this to disable setting the background color
	terminal_colors = true, -- Con***REMOVED***gure the colors used when opening a `:terminal` in [Neoivim](https://github.com/neovim/neovim)
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = { italic = true },
		variables = { italic = true },
		sidebars = ***REMOVED***transparent***REMOVED***, -- style for sidebars, see below
		floats = ***REMOVED***transparent***REMOVED***, -- style for floating windows
	},
	sidebars = { ***REMOVED***qf***REMOVED***, ***REMOVED***help***REMOVED*** }, -- Set a darker background on sidebar-like windows. For example: `[***REMOVED***qf***REMOVED***, ***REMOVED***vista_kind***REMOVED***, ***REMOVED***terminal***REMOVED***, ***REMOVED***packer***REMOVED***]`
	day_brightness = 1.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = true, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

	cache = true,
	on_colors = function(colors)
		colors.hint = colors.orange
	end,
	plugins = {
		all = package.loaded.lazy == nil,
		auto = true,
		telescope = true,
	},
})

vim.cmd.colorscheme(***REMOVED***tokyonight***REMOVED***)
