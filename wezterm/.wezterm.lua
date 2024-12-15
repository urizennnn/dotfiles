local wezterm = require(***REMOVED***wezterm***REMOVED***)
local con***REMOVED***g = wezterm.con***REMOVED***g_builder()

con***REMOVED***g.enable_tab_bar = false
con***REMOVED***g.window_decorations = ***REMOVED***RESIZE***REMOVED***
con***REMOVED***g.window_background_opacity = 0.6
con***REMOVED***g.enable_wayland = true

return con***REMOVED***g
