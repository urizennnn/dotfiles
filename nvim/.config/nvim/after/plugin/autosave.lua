local autosave_enabled = true

local function ToggleAutoSave()
	autosave_enabled = not autosave_enabled
	print(***REMOVED***AutoSave is now ***REMOVED*** .. (autosave_enabled and ***REMOVED***Enabled***REMOVED*** or ***REMOVED***Disabled***REMOVED***))
end

vim.api.nvim_create_user_command(***REMOVED***AutoSave***REMOVED***, ToggleAutoSave, {})

local function setup_auto_save(settings)
	if settings.auto_save then
		local group = vim.api.nvim_create_augroup(***REMOVED***AutoSave***REMOVED***, { clear = true })
		vim.api.nvim_create_autocmd({ ***REMOVED***InsertLeave***REMOVED***, ***REMOVED***TextChanged***REMOVED*** }, {
			group = group,
			callback = function()
				vim.cmd(***REMOVED***silent! wa***REMOVED***)
			end,
		})
	***REMOVED***
		vim.api.nvim_create_augroup(***REMOVED***AutoSave***REMOVED***, { clear = true })
	end
end

local function load_settings()
	local cwd = vim.fn.getcwd()
	local settings_***REMOVED***le = cwd .. ***REMOVED***/settings.lua***REMOVED***

	if vim.fn.***REMOVED***lereadable(settings_***REMOVED***le) == 1 then
		local settings = do***REMOVED***le(settings_***REMOVED***le)
		setup_auto_save(settings)
		vim.notify(***REMOVED***Settings from CWD applied!***REMOVED***)
	***REMOVED***
		vim.notify(***REMOVED***No settings.lua found in CWD. Using defaults***REMOVED***, vim.log.levels.WARN)
	end
end

load_settings()

vim.api.nvim_create_autocmd(***REMOVED***DirChanged***REMOVED***, {
	group = vim.api.nvim_create_augroup(***REMOVED***ReloadCwdSettings***REMOVED***, { clear = true }),
	callback = function()
		vim.notify(***REMOVED***Con***REMOVED***g reloaded***REMOVED***, vim.log.levels.INFO)
		load_settings()
	end,
})
