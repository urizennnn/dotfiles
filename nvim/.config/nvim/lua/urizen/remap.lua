local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
vim.g.mapleader = ***REMOVED*** ***REMOVED***
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>x***REMOVED***, ***REMOVED***<cmd> :bdelete <cr>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>***REMOVED***, ***REMOVED***:NvimTreeToggle<CR>***REMOVED***, { noremap = true, silent = true })
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<C-d>zz***REMOVED***, ***REMOVED***10j***REMOVED***)
keymap(***REMOVED***v***REMOVED***, ***REMOVED***J***REMOVED***, ***REMOVED***:m '>+1<CR>gv=gv***REMOVED***)
keymap(***REMOVED***v***REMOVED***, ***REMOVED***K***REMOVED***, ***REMOVED***:m '<-2<CR>gv=gv***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<C-u>zz***REMOVED***, ***REMOVED***10k***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<C-v>***REMOVED***, '***REMOVED***+p***REMOVED***')
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<C-c>***REMOVED***, '***REMOVED***+y***REMOVED***')
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<C-l>***REMOVED***, vim.cmd.Lazy)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***M***REMOVED***, vim.cmd.Mason)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***git***REMOVED***, function()
	Snacks.lazygit()
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***W***REMOVED***, ***REMOVED***<cmd> w<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***wq***REMOVED***, ***REMOVED***<cmd> wq<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***Q***REMOVED***, ***REMOVED***<cmd> quitall<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***qq***REMOVED***, ***REMOVED***<cmd> qa<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***so***REMOVED***, ***REMOVED***<cmd> so<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>xx***REMOVED***, function()
	require(***REMOVED***trouble***REMOVED***).toggle()
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>n***REMOVED***, ***REMOVED***<cmd> bn <cr>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>xw***REMOVED***, function()
	require(***REMOVED***trouble***REMOVED***).toggle(***REMOVED***workspace_diagnostics***REMOVED***)
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>xd***REMOVED***, function()
	require(***REMOVED***trouble***REMOVED***).toggle(***REMOVED***document_diagnostics***REMOVED***)
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***qf***REMOVED***, function()
	require(***REMOVED***trouble***REMOVED***).toggle(***REMOVED***quick***REMOVED***x***REMOVED***)
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>xl***REMOVED***, function()
	require(***REMOVED***trouble***REMOVED***).toggle(***REMOVED***loclist***REMOVED***)
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***gR***REMOVED***, function()
	require(***REMOVED***trouble***REMOVED***).toggle(***REMOVED***lsp_references***REMOVED***)
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***vs***REMOVED***, ***REMOVED***<cmd> :vs <cr>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***nd***REMOVED***, ***REMOVED***:NoiceDismiss<CR>***REMOVED***, { silent = true })
keymap(***REMOVED***n***REMOVED***, ***REMOVED***ee***REMOVED***, ***REMOVED***$***REMOVED***)
keymap(***REMOVED***v***REMOVED***, ***REMOVED***ee***REMOVED***, ***REMOVED***$***REMOVED***)
keymap(***REMOVED***v***REMOVED***, ***REMOVED***K***REMOVED***, ***REMOVED***:move '<-2<CR>gv=gv***REMOVED***, { silent = true })
keymap(***REMOVED***v***REMOVED***, ***REMOVED***J***REMOVED***, ***REMOVED***:move '>+1<CR>gv=gv***REMOVED***, { silent = true })
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>;***REMOVED***, ***REMOVED***<cmd> :norm A; <CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>c***REMOVED***, ***REMOVED***<cmd> Copilot disable<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>C***REMOVED***, ***REMOVED***<cmd> Copilot enable<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<A-Up>***REMOVED***, ***REMOVED***<cmd> resize +2<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<C-Down>***REMOVED***, ***REMOVED***<cmd> resize -2<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<C-Left>***REMOVED***, ***REMOVED***<cmd> vertical resize +2<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<C-Right>***REMOVED***, ***REMOVED***<cmd> vertical resize -2<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***help***REMOVED***, ***REMOVED***<cmd> :Telescope help_tags<CR>***REMOVED***, { silent = true })
keymap(***REMOVED***n***REMOVED***, ***REMOVED***live***REMOVED***, ***REMOVED***<cmd>:LiveServerStart<CR>***REMOVED***, { silent = true })
keymap(***REMOVED***n***REMOVED***, ***REMOVED***stop***REMOVED***, ***REMOVED***<cmd>:LiveServerStop<CR>***REMOVED***, { silent = true })
keymap(***REMOVED***n***REMOVED***, ***REMOVED***GB***REMOVED***, ***REMOVED***<cmd>GitBlameToggle<return>***REMOVED***, { silent = true, noremap = true })
keymap(***REMOVED***n***REMOVED***, ***REMOVED***open***REMOVED***, ***REMOVED***<cmd>:GitBlameOpenCommitURL<CR>***REMOVED***, { silent = true, noremap = true })
local bufnr = vim.api.nvim_get_current_buf()
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>a***REMOVED***, function()
	vim.cmd.RustLsp(***REMOVED***codeAction***REMOVED***)
end, { silent = true, buffer = bufnr })

keymap(***REMOVED***n***REMOVED***, ***REMOVED***cargo***REMOVED***, function()
	vim.cmd.RustLsp(***REMOVED***openCargo***REMOVED***)
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>h***REMOVED***, function()
	vim.cmd.RustLsp({ ***REMOVED***hover***REMOVED***, ***REMOVED***actions***REMOVED*** })
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***graph***REMOVED***, ***REMOVED***<cmd>:RustLsp crateGraph {backend {output}}<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***join***REMOVED***, function()
	vim.cmd.RustLsp(***REMOVED***joinLines***REMOVED***)
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***tree***REMOVED***, function()
	vim.cmd.RustLsp(***REMOVED***syntaxTree***REMOVED***)
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>t***REMOVED***, ***REMOVED***:TodoTelescope<CR>***REMOVED***, { silent = true })
keymap(***REMOVED***n***REMOVED***, ***REMOVED***run***REMOVED***, ***REMOVED***<cmd:Rest run<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***last***REMOVED***, ***REMOVED***<cmd:Rest last<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***gl***REMOVED***, ***REMOVED***<cmd>lua vim.diagnostic.open_float()<CR>***REMOVED***, { silent = true, buffer = bufnr })
keymap(***REMOVED***n***REMOVED***, ***REMOVED***db***REMOVED***, ***REMOVED***<cmd>DBUIToggle<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***dbs***REMOVED***, ***REMOVED***<cmd>DBUIAddConnection<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***tt***REMOVED***, ***REMOVED***<cmd>tabnew<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***tq***REMOVED***, ***REMOVED***<cmd>tabclose<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***tn***REMOVED***, ***REMOVED***<cmd>tabnext<CR>***REMOVED***)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***md***REMOVED***, ***REMOVED***<cmd>RenderMarkdown toggle<CR>***REMOVED***)
keymap(***REMOVED***v***REMOVED***, ***REMOVED***take***REMOVED***, ***REMOVED***<cmd>CodeSnap<CR>***REMOVED***)
keymap(***REMOVED***i***REMOVED***, ***REMOVED***<C-h>***REMOVED***, ***REMOVED***<Left>***REMOVED***, opts)
keymap(***REMOVED***i***REMOVED***, ***REMOVED***<C-j>***REMOVED***, ***REMOVED***<Down>***REMOVED***, opts)
keymap(***REMOVED***i***REMOVED***, ***REMOVED***<C-k>***REMOVED***, ***REMOVED***<Up>***REMOVED***, opts)
keymap(***REMOVED***i***REMOVED***, ***REMOVED***<A-l>***REMOVED***, ***REMOVED***<Right>***REMOVED***, opts)
local function show_diagnostics()
	vim.diagnostic.open_float(nil, {
		focus = false,
		border = { ***REMOVED***╭***REMOVED***, ***REMOVED***─***REMOVED***, ***REMOVED***╮***REMOVED***, ***REMOVED***│***REMOVED***, ***REMOVED***╯***REMOVED***, ***REMOVED***─***REMOVED***, ***REMOVED***╰***REMOVED***, ***REMOVED***│***REMOVED*** },
		format = function(diagnostic)
			local lsp_name = diagnostic.source and string.format(***REMOVED***LSP: %s***REMOVED***, diagnostic.source) or ***REMOVED***LSP: Unknown***REMOVED***
			local error_message = string.format(***REMOVED***%s [%s]***REMOVED***, diagnostic.message, diagnostic.code or ***REMOVED***N/A***REMOVED***)
			return string.format(***REMOVED***%s\n%s***REMOVED***, lsp_name, error_message)
		end,
	})
end

keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader><Enter>***REMOVED***, show_diagnostics, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***md***REMOVED***, ***REMOVED***<cmd>MarkdownPreviewToggle<CR>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader><leader>***REMOVED***, ***REMOVED***<cmd>e#<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>r***REMOVED***, ***REMOVED***:RescueRestart<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>o***REMOVED***, ***REMOVED***:Rescue<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>gf***REMOVED***, function()
	Snacks.lazygit.log_***REMOVED***le()
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<c-/>***REMOVED***, function()
	Snacks.terminal()
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<c-_>***REMOVED***, function()
	Snacks.terminal()
end)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>ct***REMOVED***, ***REMOVED***<cmd>Crates toggle<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cr***REMOVED***, ***REMOVED***<cmd>Crates reload<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cv***REMOVED***, ***REMOVED***<cmd>Crates show_versions_popup<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cf***REMOVED***, ***REMOVED***<cmd>Crates show_features_popup<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cd***REMOVED***, ***REMOVED***<cmd>Crates show_dependencies_popup<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cu***REMOVED***, ***REMOVED***<cmd>Crates update_crate<return>***REMOVED***, opts)
keymap(***REMOVED***v***REMOVED***, ***REMOVED***<leader>cu***REMOVED***, ***REMOVED***<cmd>Crates update_crates<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>ca***REMOVED***, ***REMOVED***<cmd>Crates update_all_crates<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cU***REMOVED***, ***REMOVED***<cmd>Crates upgrade_crate<return>***REMOVED***, opts)
keymap(***REMOVED***v***REMOVED***, ***REMOVED***<leader>cU***REMOVED***, ***REMOVED***<cmd>Crates upgrade_crates<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cA***REMOVED***, ***REMOVED***<cmd>Crates upgrade_all_crates<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cx***REMOVED***, ***REMOVED***<cmd>Crates expand_plain_crate_to_inline_table<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cX***REMOVED***, ***REMOVED***<cmd>Crates extract_crate_into_table<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cH***REMOVED***, ***REMOVED***<cmd>Crates open_homepage<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cR***REMOVED***, ***REMOVED***<cmd>Crates open_repository<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cD***REMOVED***, ***REMOVED***<cmd>Crates open_documentation<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cC***REMOVED***, ***REMOVED***<cmd>Crates open_crates_io<return>***REMOVED***, opts)
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<leader>cL***REMOVED***, ***REMOVED***<cmd>Crates open_lib_rs<return>***REMOVED***, opts)
keymap(***REMOVED***v***REMOVED***, ***REMOVED***p***REMOVED***, '***REMOVED***_dP', opts)
keymap(***REMOVED***v***REMOVED***, ***REMOVED***<leader>yl***REMOVED***, function()
	vim.fn.setreg(***REMOVED***+***REMOVED***, string.lower(vim.fn.getreg('***REMOVED***')))
end, { desc = ***REMOVED***Yank to clipboard and lowercase***REMOVED*** })
keymap(***REMOVED***n***REMOVED***, ***REMOVED***[c***REMOVED***, function()
	require(***REMOVED***treesitter-context***REMOVED***).go_to_context(vim.v.count1)
end, { silent = true })

-- Disable PgUp and PgDn in Normal Mode
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<PageUp>***REMOVED***, ***REMOVED***<Nop>***REMOVED***, { noremap = true, silent = true })
keymap(***REMOVED***n***REMOVED***, ***REMOVED***<PageDown>***REMOVED***, ***REMOVED***<Nop>***REMOVED***, { noremap = true, silent = true })
keymap(***REMOVED***i***REMOVED***, ***REMOVED***<PageUp>***REMOVED***, ***REMOVED***<Nop>***REMOVED***, { noremap = true, silent = true })
keymap(***REMOVED***i***REMOVED***, ***REMOVED***<PageDown>***REMOVED***, ***REMOVED***<Nop>***REMOVED***, { noremap = true, silent = true })
keymap(***REMOVED***v***REMOVED***, ***REMOVED***<PageUp>***REMOVED***, ***REMOVED***<Nop>***REMOVED***, { noremap = true, silent = true })
keymap(***REMOVED***v***REMOVED***, ***REMOVED***<PageDown>***REMOVED***, ***REMOVED***<Nop>***REMOVED***, { noremap = true, silent = true })
keymap(
	***REMOVED***n***REMOVED***,
	***REMOVED***<leader>kk***REMOVED***,
	***REMOVED***<cmd>lua require('kulala').run()<cr>***REMOVED***,
	{ noremap = true, silent = true, desc = ***REMOVED***Execute the request***REMOVED*** }
)
keymap(
	***REMOVED***n***REMOVED***,
	***REMOVED***[***REMOVED***,
	***REMOVED***<cmd>lua require('kulala').jump_prev()<cr>***REMOVED***,
	{ noremap = true, silent = true, desc = ***REMOVED***Jump to the previous request***REMOVED*** }
)
keymap(
	***REMOVED***n***REMOVED***,
	***REMOVED***]***REMOVED***,
	***REMOVED***<cmd>lua require('kulala').jump_next()<cr>***REMOVED***,
	{ noremap = true, silent = true, desc = ***REMOVED***Jump to the next request***REMOVED*** }
)
keymap(
	***REMOVED***n***REMOVED***,
	***REMOVED***<leader>i***REMOVED***,
	***REMOVED***<cmd>lua require('kulala').inspect()<cr>***REMOVED***,
	{ noremap = true, silent = true, desc = ***REMOVED***Inspect the current request***REMOVED*** }
)
keymap(
	***REMOVED***n***REMOVED***,
	***REMOVED***<leader>t***REMOVED***,
	***REMOVED***<cmd>lua require('kulala').toggle_view()<cr>***REMOVED***,
	{ noremap = true, silent = true, desc = ***REMOVED***Toggle between body and headers***REMOVED*** }
)
keymap(
	***REMOVED***n***REMOVED***,
	***REMOVED***<leader>r***REMOVED***,
	***REMOVED***<cmd>lua require('kulala').run_all()<cr>***REMOVED***,
	{ noremap = true, silent = true, desc = ***REMOVED***Toggle headers***REMOVED*** }
)
keymap(
	***REMOVED***n***REMOVED***,
	***REMOVED***<leader>rr***REMOVED***,
	***REMOVED***<cmd>lua require('kulala').replay()<cr>***REMOVED***,
	{ noremap = true, silent = true, desc = ***REMOVED***Toggle headers***REMOVED*** }
)
keymap(
	***REMOVED***n***REMOVED***,
	***REMOVED***<leader>i***REMOVED***,
	***REMOVED***<cmd>lua require('kulala').inspect()<cr>***REMOVED***,
	{ noremap = true, silent = true, desc = ***REMOVED***Toggle headers***REMOVED*** }
)
keymap(
	***REMOVED***n***REMOVED***,
	***REMOVED***<leader>ks***REMOVED***,
	***REMOVED***<cmd>lua require('kulala').scratchpad()<cr>***REMOVED***,
	{ noremap = true, silent = true, desc = ***REMOVED***Toggle headers***REMOVED*** }
)
