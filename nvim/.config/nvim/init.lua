require(***REMOVED***urizen***REMOVED***)
local snacks = require(***REMOVED***plugin-con***REMOVED***g.snacks***REMOVED***)

vim.api.nvim_set_hl(0, ***REMOVED***DiagnosticUnnecessary***REMOVED***, { fg = ***REMOVED***#808080***REMOVED*** })
vim.lsp.set_log_level(***REMOVED***debug***REMOVED***)

vim.g.db_ui_use_nvim_notify = 1
vim.g.lazydev_enabled = true
vim.g.mkdp_port = 2000
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_page_title = ***REMOVED***「${name}」***REMOVED***
vim.g.mkdp_***REMOVED***letypes = { ***REMOVED***markdown***REMOVED*** }
vim.g.mkdp_theme = ***REMOVED***dark***REMOVED***
vim.g.loaded_netrwPlugin = 1

vim.diagnostic.con***REMOVED***g({
	virtual_text = { pre***REMOVED***x = ***REMOVED***●***REMOVED***, spacing = 4 },
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

vim.g.mapleader = ***REMOVED*** ***REMOVED***
vim.g.maplocalleader = ***REMOVED*** ***REMOVED***
vim.o.updatetime = 250

vim.g.clipboard = {
	name = ***REMOVED***wl-clipboard***REMOVED***,
	copy = { [***REMOVED***+***REMOVED***] = ***REMOVED***wl-copy***REMOVED***, [***REMOVED*******REMOVED***] = ***REMOVED***wl-copy***REMOVED*** },
	paste = { [***REMOVED***+***REMOVED***] = ***REMOVED***wl-paste --no-newline***REMOVED***, [***REMOVED*******REMOVED***] = ***REMOVED***wl-paste --no-newline***REMOVED*** },
	cache_enabled = 0,
}
vim.opt.clipboard = ***REMOVED***unnamedplus***REMOVED***
vim.g.have_nerd_font = true
vim.opt.scrollback = 100000
vim.opt.lazyredraw = true
vim.opt.number = true
vim.opt.showmode = true

local macro_group = vim.api.nvim_create_augroup(***REMOVED***MacroRecording***REMOVED***, { clear = true })
vim.api.nvim_create_autocmd(***REMOVED***RecordingLeave***REMOVED***, {
	group = macro_group,
	callback = function()
		print(***REMOVED***Macro recording stopped***REMOVED***)
	end,
})

vim.opt.breakindent = true
vim.opt.undo***REMOVED***le = true
vim.opt.timeoutlen = 300
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = ***REMOVED***yes***REMOVED***
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = ***REMOVED***» ***REMOVED***, trail = ***REMOVED***·***REMOVED***, nbsp = ***REMOVED***␣***REMOVED*** }
vim.opt.inccommand = ***REMOVED***split***REMOVED***
vim.opt.scrolloff = 10
vim.opt.hlsearch = true

vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<Esc>***REMOVED***, ***REMOVED***<cmd>nohlsearch<CR>***REMOVED***)
vim.keymap.set(***REMOVED***i***REMOVED***, ***REMOVED***jk***REMOVED***, ***REMOVED***<Esc>***REMOVED***)
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***[d***REMOVED***, vim.diagnostic.goto_prev, { desc = ***REMOVED***Prev Diagnostic***REMOVED*** })
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***]d***REMOVED***, vim.diagnostic.goto_next, { desc = ***REMOVED***Next Diagnostic***REMOVED*** })
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>e***REMOVED***, vim.diagnostic.open_float, { desc = ***REMOVED***Show Diagnostics***REMOVED*** })
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>q***REMOVED***, vim.diagnostic.setloclist, { desc = ***REMOVED***Diagnostics Quick***REMOVED***x***REMOVED*** })
vim.keymap.set(***REMOVED***t***REMOVED***, ***REMOVED***<Esc><Esc>***REMOVED***, ***REMOVED***<C-\\><C-n>***REMOVED***, { desc = ***REMOVED***Exit terminal mode***REMOVED*** })

vim.api.nvim_create_autocmd(***REMOVED***TextYankPost***REMOVED***, {
	desc = ***REMOVED***Highlight on yank***REMOVED***,
	group = vim.api.nvim_create_augroup(***REMOVED***kickstart-highlight-yank***REMOVED***, { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local lazypath = vim.fn.stdpath(***REMOVED***data***REMOVED***) .. ***REMOVED***/lazy/lazy.nvim***REMOVED***
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = ***REMOVED***https://github.com/folke/lazy.nvim.git***REMOVED***
	vim.fn.system({ ***REMOVED***git***REMOVED***, ***REMOVED***clone***REMOVED***, ***REMOVED***--***REMOVED***lter=blob:none***REMOVED***, ***REMOVED***--branch=stable***REMOVED***, lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require(***REMOVED***lazy***REMOVED***).setup({
	***REMOVED***tpope/vim-sleuth***REMOVED***,
	dev = { reload = true },
	{
		***REMOVED***mistweaverco/kulala.nvim***REMOVED***,
		opts = {
			curl_path = ***REMOVED***curl***REMOVED***,
			display_mode = ***REMOVED***split***REMOVED***,
			q_to_close_float = false,
			split_direction = ***REMOVED***vertical***REMOVED***,
			default_view = ***REMOVED***body***REMOVED***,
			default_env = ***REMOVED***dev***REMOVED***,
			debug = false,
			contenttypes = {
				[***REMOVED***application/json***REMOVED***] = { ft = ***REMOVED***json***REMOVED***, formatter = { ***REMOVED***jq***REMOVED***, ***REMOVED***.***REMOVED*** } },
				[***REMOVED***application/xml***REMOVED***] = {
					ft = ***REMOVED***xml***REMOVED***,
					formatter = { ***REMOVED***xmllint***REMOVED***, ***REMOVED***--format***REMOVED***, ***REMOVED***-***REMOVED*** },
					pathresolver = { ***REMOVED***xmllint***REMOVED***, ***REMOVED***--xpath***REMOVED***, ***REMOVED***{{path}}***REMOVED***, ***REMOVED***-***REMOVED*** },
				},
				[***REMOVED***text/html***REMOVED***] = { ft = ***REMOVED***html***REMOVED***, formatter = { ***REMOVED***xmllint***REMOVED***, ***REMOVED***--format***REMOVED***, ***REMOVED***--html***REMOVED***, ***REMOVED***-***REMOVED*** }, pathresolver = {} },
			},
			show_icons = ***REMOVED***on_request***REMOVED***,
			icons = { inlay = { loading = ***REMOVED***⏳***REMOVED***, done = ***REMOVED***✅***REMOVED***, error = ***REMOVED***❌***REMOVED*** }, lualine = ***REMOVED***🐼***REMOVED*** },
			additional_curl_options = {},
			scratchpad_default_contents = {
				***REMOVED***@MY_TOKEN_NAME=my_token_value***REMOVED***,
				***REMOVED******REMOVED***,
				***REMOVED***# @name scratchpad***REMOVED***,
				***REMOVED***POST https://httpbin.org/post HTTP/1.1***REMOVED***,
				***REMOVED***accept: application/json***REMOVED***,
				***REMOVED***content-type: application/json***REMOVED***,
				***REMOVED******REMOVED***,
				***REMOVED***{***REMOVED***,
				'  ***REMOVED***foo***REMOVED***: ***REMOVED***bar***REMOVED***',
				***REMOVED***}***REMOVED***,
			},
			winbar = false,
			default_winbar_panes = { ***REMOVED***body***REMOVED***, ***REMOVED***headers***REMOVED***, ***REMOVED***headers_body***REMOVED***, ***REMOVED***verbose***REMOVED*** },
			vscode_rest_client_environmentvars = false,
			disable_script_print_output = false,
			environment_scope = ***REMOVED***b***REMOVED***,
			certi***REMOVED***cates = {},
			urlencode = ***REMOVED***always***REMOVED***,
		},
	},
	{ ***REMOVED***nvim-treesitter/playground***REMOVED***, cmd = ***REMOVED***TSHighlightCapturesUnderCursor***REMOVED*** },
	{ ***REMOVED***catppuccin/nvim***REMOVED***, name = ***REMOVED***catppuccin***REMOVED***, priority = 1000, lazy = false },
	{
		***REMOVED***folke/snacks.nvim***REMOVED***,
		priority = 1000,
		lazy = false,
		opts = snacks,
		keys = snacks.keys,
		init = function()
			vim.api.nvim_create_autocmd(***REMOVED***User***REMOVED***, {
				pattern = ***REMOVED***VeryLazy***REMOVED***,
				callback = function()
					_G.dd = function(...)
						require(***REMOVED***plugin-con***REMOVED***g.snacks***REMOVED***).debug.inspect(...)
					end
					_G.bt = function()
						require(***REMOVED***plugin-con***REMOVED***g.snacks***REMOVED***).debug.backtrace()
					end
					vim.print = _G.dd
					require(***REMOVED***plugin-con***REMOVED***g.snacks***REMOVED***).toggle.option(***REMOVED***spell***REMOVED***, { name = ***REMOVED***Spelling***REMOVED*** }):map(***REMOVED***<leader>us***REMOVED***)
					require(***REMOVED***plugin-con***REMOVED***g.snacks***REMOVED***).toggle.option(***REMOVED***wrap***REMOVED***, { name = ***REMOVED***Wrap***REMOVED*** }):map(***REMOVED***<leader>uw***REMOVED***)
					require(***REMOVED***plugin-con***REMOVED***g.snacks***REMOVED***).toggle
						.option(***REMOVED***relativenumber***REMOVED***, { name = ***REMOVED***Relative Number***REMOVED*** })
						:map(***REMOVED***<leader>uL***REMOVED***)
					require(***REMOVED***plugin-con***REMOVED***g.snacks***REMOVED***).toggle.diagnostics():map(***REMOVED***<leader>ud***REMOVED***)
					require(***REMOVED***plugin-con***REMOVED***g.snacks***REMOVED***).toggle.line_number():map(***REMOVED***<leader>ul***REMOVED***)
					require(***REMOVED***plugin-con***REMOVED***g.snacks***REMOVED***).toggle
						.option(***REMOVED***conceallevel***REMOVED***, { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map(***REMOVED***<leader>uc***REMOVED***)
					require(***REMOVED***plugin-con***REMOVED***g.snacks***REMOVED***).toggle.treesitter():map(***REMOVED***<leader>uT***REMOVED***)
					require(***REMOVED***plugin-con***REMOVED***g.snacks***REMOVED***).toggle
						.option(***REMOVED***background***REMOVED***, { off = ***REMOVED***light***REMOVED***, on = ***REMOVED***dark***REMOVED***, name = ***REMOVED***Dark Background***REMOVED*** })
						:map(***REMOVED***<leader>ub***REMOVED***)
					require(***REMOVED***plugin-con***REMOVED***g.snacks***REMOVED***).toggle.inlay_hints():map(***REMOVED***<leader>uh***REMOVED***)
				end,
			})
		end,
	},
	{
		***REMOVED***iamcco/markdown-preview.nvim***REMOVED***,
		cmd = { ***REMOVED***MarkdownPreviewToggle***REMOVED***, ***REMOVED***MarkdownPreview***REMOVED***, ***REMOVED***MarkdownPreviewStop***REMOVED*** },
		build = ***REMOVED***cd app && yarn install***REMOVED***,
		init = function()
			vim.g.mkdp_***REMOVED***letypes = { ***REMOVED***markdown***REMOVED*** }
		end,
		ft = { ***REMOVED***markdown***REMOVED*** },
	},
	{
		***REMOVED***nvim-treesitter/nvim-treesitter-context***REMOVED***,
		dependencies = { ***REMOVED***nvim-treesitter/nvim-treesitter***REMOVED*** },
		con***REMOVED***g = function()
			require(***REMOVED***treesitter-context***REMOVED***).setup({
				enable = true,
				max_lines = 3,
				trim_scope = ***REMOVED***outer***REMOVED***,
				mode = ***REMOVED***cursor***REMOVED***,
				line_numbers = true,
				multiwindow = true,
			})
		end,
	},
	{
		***REMOVED***hrsh7th/nvim-cmp***REMOVED***,
		event = { ***REMOVED***InsertEnter***REMOVED***, ***REMOVED***CmdlineEnter***REMOVED*** },
		dependencies = {
			***REMOVED***hrsh7th/cmp-nvim-lsp***REMOVED***,
			***REMOVED***hrsh7th/cmp-nvim-lua***REMOVED***,
			***REMOVED***hrsh7th/cmp-buffer***REMOVED***,
			***REMOVED***hrsh7th/cmp-path***REMOVED***,
			***REMOVED***hrsh7th/cmp-cmdline***REMOVED***,
			***REMOVED***hrsh7th/cmp-emoji***REMOVED***,
			***REMOVED***L3MON4D3/LuaSnip***REMOVED***,
		},
	},
	{
		***REMOVED***Saecki/crates.nvim***REMOVED***,
		event = { ***REMOVED***BufRead Cargo.toml***REMOVED*** },
		con***REMOVED***g = function()
			require(***REMOVED***crates***REMOVED***).setup()
		end,
	},
	{ ***REMOVED***rcarriga/nvim-notify***REMOVED*** },
	{
		***REMOVED***kylechui/nvim-surround***REMOVED***,
		version = ***REMOVED*******REMOVED***,
		event = ***REMOVED***VeryLazy***REMOVED***,
		con***REMOVED***g = function()
			require(***REMOVED***nvim-surround***REMOVED***).setup()
		end,
	},
	{
		***REMOVED***Wansmer/treesj***REMOVED***,
		keys = { ***REMOVED***<space>m***REMOVED***, ***REMOVED***<space>j***REMOVED***, ***REMOVED***<space>s***REMOVED*** },
		dependencies = { ***REMOVED***nvim-treesitter/nvim-treesitter***REMOVED*** },
		con***REMOVED***g = function()
			require(***REMOVED***treesj***REMOVED***).setup()
		end,
	},
	{ ***REMOVED***nanotee/sqls.nvim***REMOVED*** },
	{ ***REMOVED***kristijanhusak/vim-dadbod-completion***REMOVED*** },
	{
		***REMOVED***kristijanhusak/vim-dadbod-ui***REMOVED***,
		dependencies = {
			{ ***REMOVED***tpope/vim-dadbod***REMOVED***, lazy = true },
			{ ***REMOVED***kristijanhusak/vim-dadbod-completion***REMOVED***, ft = { ***REMOVED***sql***REMOVED***, ***REMOVED***mysql***REMOVED***, ***REMOVED***psql***REMOVED***, ***REMOVED***mongodb***REMOVED*** } },
		},
		cmd = { ***REMOVED***DBUI***REMOVED***, ***REMOVED***DBUIToggle***REMOVED***, ***REMOVED***DBUIAddConnection***REMOVED***, ***REMOVED***DBUIFindBuffer***REMOVED*** },
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_icons = {
				expanded = ***REMOVED***▾***REMOVED***,
				collapsed = ***REMOVED***▸***REMOVED***,
				saved_query = ***REMOVED*******REMOVED***,
				new_query = ***REMOVED***+***REMOVED***,
				tables = ***REMOVED***~***REMOVED***,
				buffers = ***REMOVED***»***REMOVED***,
				connection_ok = ***REMOVED***✓***REMOVED***,
				connection_error = ***REMOVED***✕***REMOVED***,
			}
			vim.g.db_ui_disable_progress_bar = 1
		end,
	},
	{ ***REMOVED***rmagatti/auto-session***REMOVED***, con***REMOVED***g = true },
	{ ***REMOVED***akinsho/toggleterm.nvim***REMOVED***, version = ***REMOVED*******REMOVED***, con***REMOVED***g = true },
	{ ***REMOVED***mistricky/codesnap.nvim***REMOVED***, build = ***REMOVED***make build_generator***REMOVED*** },
	{
		***REMOVED***MeanderingProgrammer/render-markdown.nvim***REMOVED***,
		opts = {},
		dependencies = { ***REMOVED***nvim-treesitter/nvim-treesitter***REMOVED***, ***REMOVED***echasnovski/mini.nvim***REMOVED*** },
	},
	{
		***REMOVED***ThePrimeagen/harpoon***REMOVED***,
		branch = ***REMOVED***harpoon2***REMOVED***,
		dependencies = { ***REMOVED***nvim-lua/plenary.nvim***REMOVED*** },
	},
	{ ***REMOVED***numToStr/Comment.nvim***REMOVED***, opts = {} },
	{
		***REMOVED***barrett-ruth/live-server.nvim***REMOVED***,
		build = ***REMOVED***pnpm add -g live-server***REMOVED***,
		cmd = { ***REMOVED***LiveServerStart***REMOVED***, ***REMOVED***LiveServerStop***REMOVED*** },
		con***REMOVED***g = true,
	},
	{
		***REMOVED***nvim-treesitter/nvim-treesitter***REMOVED***,
		run = ***REMOVED***:TSUpdate***REMOVED***,
		con***REMOVED***g = function()
			require(***REMOVED***nvim-treesitter.con***REMOVED***gs***REMOVED***).setup({
				ignore_install = { ***REMOVED***haskell***REMOVED*** },
				auto_install = true,
				sync_install = true,
				ensure_installed = { ***REMOVED***markdown***REMOVED***, ***REMOVED***markdown_inline***REMOVED***, ***REMOVED***yaml***REMOVED*** },
				highlight = { enable = true },
			})
		end,
	},
	{
		***REMOVED***pwntester/octo.nvim***REMOVED***,
		requires = {
			***REMOVED***nvim-lua/plenary.nvim***REMOVED***,
			***REMOVED***nvim-telescope/telescope.nvim***REMOVED***,
			***REMOVED***ibhagwan/fzf-lua***REMOVED***,
			***REMOVED***nvim-tree/nvim-web-devicons***REMOVED***,
		},
	},
	{ ***REMOVED***f-person/git-blame.nvim***REMOVED*** },
	{ ***REMOVED***github/copilot.vim***REMOVED*** },
	{ ***REMOVED***folke/todo-comments.nvim***REMOVED***, dependencies = { ***REMOVED***nvim-lua/plenary.nvim***REMOVED*** } },
	{ ***REMOVED***folke/trouble.nvim***REMOVED***, dependencies = { ***REMOVED***nvim-tree/nvim-web-devicons***REMOVED*** } },
	{ ***REMOVED***nvim-lualine/lualine.nvim***REMOVED***, dependencies = { ***REMOVED***nvim-tree/nvim-web-devicons***REMOVED*** } },
	{ ***REMOVED***wakatime/vim-wakatime***REMOVED*** },
	{ ***REMOVED***tpope/vim-dadbod***REMOVED*** },
	{ ***REMOVED***akinsho/bufferline.nvim***REMOVED***, version = ***REMOVED*******REMOVED***, dependencies = ***REMOVED***nvim-tree/nvim-web-devicons***REMOVED*** },
	{
		***REMOVED***nvim-tree/nvim-tree.lua***REMOVED***,
		version = ***REMOVED*******REMOVED***,
		lazy = false,
		dependencies = { ***REMOVED***nvim-tree/nvim-web-devicons***REMOVED*** },
		con***REMOVED***g = function()
			require(***REMOVED***nvim-tree***REMOVED***).setup({})
		end,
	},
	{
		***REMOVED***kdheepak/lazygit.nvim***REMOVED***,
		cmd = { ***REMOVED***LazyGit***REMOVED***, ***REMOVED***LazyGitCon***REMOVED***g***REMOVED***, ***REMOVED***LazyGitCurrentFile***REMOVED***, ***REMOVED***LazyGitFilter***REMOVED***, ***REMOVED***LazyGitFilterCurrentFile***REMOVED*** },
		dependencies = { ***REMOVED***nvim-lua/plenary.nvim***REMOVED*** },
		keys = { { ***REMOVED***<leader>lg***REMOVED***, ***REMOVED***<cmd>LazyGit<cr>***REMOVED***, desc = ***REMOVED***LazyGit***REMOVED*** } },
	},
	{ ***REMOVED***windwp/nvim-autopairs***REMOVED***, event = ***REMOVED***InsertEnter***REMOVED***, con***REMOVED***g = true },
	{ ***REMOVED***nvimdev/dashboard-nvim***REMOVED***, event = ***REMOVED***vimEnter***REMOVED***, requires = { ***REMOVED***nvim-tree/nvim-web-devicons***REMOVED*** } },
	{ ***REMOVED***MunifTanjim/nui.nvim***REMOVED*** },
	{ ***REMOVED***rcarriga/nvim-notify***REMOVED*** },
	{ ***REMOVED***tpope/vim-fugitive***REMOVED*** },
	{
		***REMOVED***folke/noice.nvim***REMOVED***,
		event = ***REMOVED***VeryLazy***REMOVED***,
		dependencies = { ***REMOVED***MunifTanjim/nui.nvim***REMOVED***, ***REMOVED***rcarriga/nvim-notify***REMOVED*** },
	},
	{ ***REMOVED***cdelledonne/vim-cmake***REMOVED*** },
	{ ***REMOVED***mbbill/undotree***REMOVED*** },
	{ ***REMOVED***lewis6991/gitsigns.nvim***REMOVED*** },
	{
		***REMOVED***nvim-telescope/telescope.nvim***REMOVED***,
		event = ***REMOVED***vimEnter***REMOVED***,
		branch = ***REMOVED***0.1.x***REMOVED***,
		dependencies = {
			***REMOVED***nvim-lua/plenary.nvim***REMOVED***,
			{
				***REMOVED***nvim-telescope/telescope-fzf-native.nvim***REMOVED***,
				build = ***REMOVED***make***REMOVED***,
				cond = function()
					return vim.fn.executable(***REMOVED***make***REMOVED***) == 1
				end,
			},
			{ ***REMOVED***nvim-telescope/telescope-ui-select.nvim***REMOVED*** },
			{ ***REMOVED***nvim-tree/nvim-web-devicons***REMOVED***, enabled = vim.g.have_nerd_font },
		},
		con***REMOVED***g = function()
			require(***REMOVED***telescope***REMOVED***).setup({
				extensions = { [***REMOVED***ui-select***REMOVED***] = require(***REMOVED***telescope.themes***REMOVED***).get_dropdown() },
			})
			pcall(require(***REMOVED***telescope***REMOVED***).load_extension, ***REMOVED***fzf***REMOVED***)
			pcall(require(***REMOVED***telescope***REMOVED***).load_extension, ***REMOVED***ui-select***REMOVED***)
			pcall(require(***REMOVED***telescope***REMOVED***).load_extension, ***REMOVED***noice***REMOVED***)
			pcall(require(***REMOVED***telescope***REMOVED***).load_extension, ***REMOVED***lazygit***REMOVED***)
			local builtin = require(***REMOVED***telescope.builtin***REMOVED***)
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>sh***REMOVED***, builtin.help_tags, { desc = ***REMOVED***Search Help***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>sk***REMOVED***, builtin.keymaps, { desc = ***REMOVED***Search Keymaps***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>ss***REMOVED***, builtin.builtin, { desc = ***REMOVED***Search Telescope***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>sw***REMOVED***, builtin.grep_string, { desc = ***REMOVED***Search current word***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***lg***REMOVED***, builtin.live_grep, { desc = ***REMOVED***Live Grep***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>sd***REMOVED***, builtin.diagnostics, { desc = ***REMOVED***Search Diagnostics***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>sr***REMOVED***, builtin.resume, { desc = ***REMOVED***Resume Telescope***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>s.***REMOVED***, builtin.old***REMOVED***les, { desc = ***REMOVED***Recent Files***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***re***REMOVED***, builtin.buffers, { desc = ***REMOVED***Find buffers***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>f***REMOVED***, function()
				require(***REMOVED***telescope.builtin***REMOVED***).***REMOVED***nd_***REMOVED***les({
					***REMOVED***nd_command = { ***REMOVED***rg***REMOVED***, ***REMOVED***--ignore***REMOVED***, ***REMOVED***--hidden***REMOVED***, ***REMOVED***--***REMOVED***les***REMOVED***, ***REMOVED***--glob***REMOVED***, ***REMOVED***!**/.git/****REMOVED***, ***REMOVED***--no-ignore***REMOVED*** },
				})
			end, { noremap = true, silent = true })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>/***REMOVED***, function()
				builtin.current_buffer_fuzzy_***REMOVED***nd(
					require(***REMOVED***telescope.themes***REMOVED***).get_dropdown({ winblend = 10, previewer = false })
				)
			end, { desc = ***REMOVED***Fuzzy search in current buffer***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>s/***REMOVED***, function()
				builtin.live_grep({ grep_open_***REMOVED***les = true, prompt_title = ***REMOVED***Live Grep in Open Files***REMOVED*** })
			end, { desc = ***REMOVED***Live grep in open ***REMOVED***les***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>sn***REMOVED***, function()
				builtin.***REMOVED***nd_***REMOVED***les({ cwd = vim.fn.stdpath(***REMOVED***con***REMOVED***g***REMOVED***) })
			end, { desc = ***REMOVED***Search Neovim ***REMOVED***les***REMOVED*** })
		end,
	},
	{
		***REMOVED***urizennnn/rescue-lsp.nvim***REMOVED***,
		con***REMOVED***g = function()
			require(***REMOVED***rescue-lsp***REMOVED***).setup()
		end,
	},
	{
		***REMOVED***neovim/nvim-lspcon***REMOVED***g***REMOVED***,
		dependencies = {
			***REMOVED***williamboman/mason.nvim***REMOVED***,
			***REMOVED***williamboman/mason-lspcon***REMOVED***g.nvim***REMOVED***,
			***REMOVED***WhoIsSethDaniel/mason-tool-installer.nvim***REMOVED***,
			{ ***REMOVED***j-hui/***REMOVED***dget.nvim***REMOVED***, opts = {} },
		},
		con***REMOVED***g = function()
			vim.api.nvim_create_autocmd(***REMOVED***LspAttach***REMOVED***, {
				group = vim.api.nvim_create_augroup(***REMOVED***kickstart-lsp-attach***REMOVED***, { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set(***REMOVED***n***REMOVED***, keys, func, { buffer = event.buf, desc = ***REMOVED***LSP: ***REMOVED*** .. desc })
					end
					map(***REMOVED***gd***REMOVED***, require(***REMOVED***telescope.builtin***REMOVED***).lsp_de***REMOVED***nitions, ***REMOVED***Goto De***REMOVED***nition***REMOVED***)
					map(***REMOVED***gr***REMOVED***, require(***REMOVED***telescope.builtin***REMOVED***).lsp_references, ***REMOVED***Goto References***REMOVED***)
					map(***REMOVED***gI***REMOVED***, require(***REMOVED***telescope.builtin***REMOVED***).lsp_implementations, ***REMOVED***Goto Implementation***REMOVED***)
					map(***REMOVED***<leader>D***REMOVED***, require(***REMOVED***telescope.builtin***REMOVED***).lsp_type_de***REMOVED***nitions, ***REMOVED***Type De***REMOVED***nition***REMOVED***)
					map(***REMOVED***<leader>ds***REMOVED***, require(***REMOVED***telescope.builtin***REMOVED***).lsp_document_symbols, ***REMOVED***Document Symbols***REMOVED***)
					map(***REMOVED***<leader>ws***REMOVED***, require(***REMOVED***telescope.builtin***REMOVED***).lsp_dynamic_workspace_symbols, ***REMOVED***Workspace Symbols***REMOVED***)
					map(***REMOVED***<leader>rn***REMOVED***, vim.lsp.buf.rename, ***REMOVED***Rename***REMOVED***)
					map(***REMOVED***<leader>ca***REMOVED***, vim.lsp.buf.code_action, ***REMOVED***Code Action***REMOVED***)
					map(***REMOVED***K***REMOVED***, vim.lsp.buf.hover, ***REMOVED***Hover***REMOVED***)
					map(***REMOVED***gD***REMOVED***, vim.lsp.buf.declaration, ***REMOVED***Goto Declaration***REMOVED***)
				end,
			})
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend(***REMOVED***force***REMOVED***, capabilities, require(***REMOVED***cmp_nvim_lsp***REMOVED***).default_capabilities())
			local servers = {
				gopls = {},
				pyright = {},
				ts_ls = {},
				golangci_lint_ls = {},
				lua_ls = { settings = { Lua = { completion = { callSnippet = ***REMOVED***Replace***REMOVED*** } } } },
			}
			require(***REMOVED***mason***REMOVED***).setup()
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, { ***REMOVED***stylua***REMOVED*** })
			require(***REMOVED***mason-tool-installer***REMOVED***).setup({ ensure_installed = ensure_installed })
			require(***REMOVED***mason-lspcon***REMOVED***g***REMOVED***).setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						if server_name == ***REMOVED***tsserver***REMOVED*** then
							server_name = ***REMOVED***ts_ls***REMOVED***
						end
						server.capabilities = vim.tbl_deep_extend(***REMOVED***force***REMOVED***, {}, capabilities, server.capabilities or {})
						require(***REMOVED***lspcon***REMOVED***g***REMOVED***)[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{
		***REMOVED***stevearc/conform.nvim***REMOVED***,
		lazy = false,
		keys = {
			{
				***REMOVED***<leader>b***REMOVED***,
				function()
					require(***REMOVED***conform***REMOVED***).format({ async = true, lsp_fallback = true })
				end,
				mode = ***REMOVED******REMOVED***,
				desc = ***REMOVED***Format buffer***REMOVED***,
			},
		},
		opts = {
			format_on_save = function(bufnr)
				local disable_***REMOVED***letypes = { c = true, cpp = true }
				return { timeout_ms = 500, lsp_fallback = not disable_***REMOVED***letypes[vim.bo[bufnr].***REMOVED***letype] }
			end,
			format_after_save = { lsp_format = ***REMOVED***fallback***REMOVED*** },
			notify_no_formatters = true,
			formatters_by_ft = {
				lua = { ***REMOVED***stylua***REMOVED*** },
				python = { ***REMOVED***isort***REMOVED***, ***REMOVED***black***REMOVED*** },
				javascript = { { ***REMOVED***prettierd***REMOVED***, ***REMOVED***prettier***REMOVED*** } },
			},
		},
	},
	{
		***REMOVED***mrcjkb/rustaceanvim***REMOVED***,
		version = ***REMOVED***^4***REMOVED***,
		lazy = false,
	},
	{
		***REMOVED***hrsh7th/nvim-cmp***REMOVED***,
		event = ***REMOVED***InsertEnter***REMOVED***,
		dependencies = {
			{
				***REMOVED***L3MON4D3/LuaSnip***REMOVED***,
				build = (function()
					if vim.fn.has(***REMOVED***win32***REMOVED***) == 1 or vim.fn.executable(***REMOVED***make***REMOVED***) == 0 then
						return
					end
					return ***REMOVED***make install_jsregexp***REMOVED***
				end)(),
			},
			***REMOVED***saadparwaiz1/cmp_luasnip***REMOVED***,
			***REMOVED***hrsh7th/cmp-nvim-lsp***REMOVED***,
			***REMOVED***hrsh7th/cmp-path***REMOVED***,
		},
		con***REMOVED***g = function()
			local cmp = require(***REMOVED***cmp***REMOVED***)
			local luasnip = require(***REMOVED***luasnip***REMOVED***)
			luasnip.con***REMOVED***g.setup({})
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = ***REMOVED***menu,menuone,noinsert***REMOVED*** },
				mapping = cmp.mapping.preset.insert({
					[***REMOVED***<C-n>***REMOVED***] = cmp.mapping.select_next_item(),
					[***REMOVED***<C-p>***REMOVED***] = cmp.mapping.select_prev_item(),
					[***REMOVED***<C-b>***REMOVED***] = cmp.mapping.scroll_docs(-4),
					[***REMOVED***<C-f>***REMOVED***] = cmp.mapping.scroll_docs(4),
					[***REMOVED***<C-y>***REMOVED***] = cmp.mapping.con***REMOVED***rm({ select = true }),
					[***REMOVED***<C-Space>***REMOVED***] = cmp.mapping.complete({}),
					[***REMOVED***<C-l>***REMOVED***] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { ***REMOVED***i***REMOVED***, ***REMOVED***s***REMOVED*** }),
					[***REMOVED***<C-h>***REMOVED***] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { ***REMOVED***i***REMOVED***, ***REMOVED***s***REMOVED*** }),
				}),
				sources = { { name = ***REMOVED***nvim_lsp***REMOVED*** }, { name = ***REMOVED***luasnip***REMOVED*** }, { name = ***REMOVED***path***REMOVED*** } },
			})
		end,
	},
	{
		***REMOVED***folke/tokyonight.nvim***REMOVED***,
		priority = 1000,
		init = function()
			vim.cmd.colorscheme(***REMOVED***tokyonight***REMOVED***)
			vim.cmd.hi(***REMOVED***Comment gui=none***REMOVED***)
		end,
		con***REMOVED***g = function()
			require(***REMOVED***folke***REMOVED***)
		end,
	},
	{
		***REMOVED***folke/todo-comments.nvim***REMOVED***,
		event = ***REMOVED***vimEnter***REMOVED***,
		dependencies = { ***REMOVED***nvim-lua/plenary.nvim***REMOVED*** },
		opts = { signs = false },
	},
	{
		***REMOVED***echasnovski/mini.nvim***REMOVED***,
		con***REMOVED***g = function()
			require(***REMOVED***mini.ai***REMOVED***).setup({ n_lines = 500 })
			require(***REMOVED***mini.surround***REMOVED***).setup()
			local statusline = require(***REMOVED***mini.statusline***REMOVED***)
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			statusline.section_location = function()
				return ***REMOVED***%2l:%-2v***REMOVED***
			end
		end,
	},
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = ***REMOVED***⌘***REMOVED***,
			con***REMOVED***g = ***REMOVED***🛠***REMOVED***,
			event = ***REMOVED***📅***REMOVED***,
			ft = ***REMOVED***📂***REMOVED***,
			init = ***REMOVED***⚙***REMOVED***,
			keys = ***REMOVED***🗝***REMOVED***,
			plugin = ***REMOVED***🔌***REMOVED***,
			runtime = ***REMOVED***💻***REMOVED***,
			require = ***REMOVED***🌙***REMOVED***,
			source = ***REMOVED***📄***REMOVED***,
			start = ***REMOVED***🚀***REMOVED***,
			task = ***REMOVED***📌***REMOVED***,
			lazy = ***REMOVED***💤 ***REMOVED***,
		},
	},
})
