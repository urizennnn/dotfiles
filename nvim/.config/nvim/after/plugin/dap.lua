require(***REMOVED***dapui***REMOVED***).setup()

local dap, dapui = require(***REMOVED***dap***REMOVED***), require(***REMOVED***dapui***REMOVED***)

dap.listeners.after.event_initialized[***REMOVED***dapui_con***REMOVED***g***REMOVED***] = function()
	dapui.open()
end

dap.listeners.before.event_terminated[***REMOVED***dapui_con***REMOVED***g***REMOVED***] = function()
	dapui.close()
end

dap.listeners.before.event_exited[***REMOVED***dapui_con***REMOVED***g***REMOVED***] = function()
	dapui.close()
end

vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>dt***REMOVED***, ***REMOVED***:DapToggleBreakpoint<CR>***REMOVED***)
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>dx***REMOVED***, ***REMOVED***DapTerminate<CR>***REMOVED***)
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>do***REMOVED***, ***REMOVED***:DapStepOver<CR>***REMOVED***)
