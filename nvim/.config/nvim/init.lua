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
	virtual_text = {
		pre***REMOVED***x = ***REMOVED***●***REMOVED***, -- Could be '■', '▎', 'x'
		spacing = 4,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})
-- optionally enable 24-bit colour
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ***REMOVED*** ***REMOVED***
vim.g.maplocalleader = ***REMOVED*** ***REMOVED***
vim.o.updatetime = 1

vim.g.clipboard = {
	name = ***REMOVED***wl-clipboard***REMOVED***,
	copy = {
		[***REMOVED***+***REMOVED***] = ***REMOVED***wl-copy***REMOVED***,
		[***REMOVED*******REMOVED***] = ***REMOVED***wl-copy***REMOVED***,
	},
	paste = {
		[***REMOVED***+***REMOVED***] = ***REMOVED***wl-paste --no-newline***REMOVED***,
		[***REMOVED*******REMOVED***] = ***REMOVED***wl-paste --no-newline***REMOVED***,
	},
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
		-- Display a message when macro recording stops
		print(***REMOVED***Macro recording stopped***REMOVED***)
	end,
})

vim.opt.breakindent = true

vim.opt.undo***REMOVED***le = true

vim.opt.timeoutlen = 300
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = ***REMOVED***yes***REMOVED***

vim.opt.updatetime = 250

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = ***REMOVED***» ***REMOVED***, trail = ***REMOVED***·***REMOVED***, nbsp = ***REMOVED***␣***REMOVED*** }

-- Preview substitutions live, as you type!
vim.opt.inccommand = ***REMOVED***split***REMOVED***

vim.opt.scrolloff = 10

vim.opt.hlsearch = true
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<Esc>***REMOVED***, ***REMOVED***<cmd>nohlsearch<CR>***REMOVED***)
vim.keymap.set(***REMOVED***i***REMOVED***, ***REMOVED***jk***REMOVED***, ***REMOVED***<Esc>***REMOVED***)

-- Diagnostic keymaps
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***[d***REMOVED***, vim.diagnostic.goto_prev, { desc = ***REMOVED***Go to previous [D]iagnostic message***REMOVED*** })
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***]d***REMOVED***, vim.diagnostic.goto_next, { desc = ***REMOVED***Go to next [D]iagnostic message***REMOVED*** })
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>e***REMOVED***, vim.diagnostic.open_float, { desc = ***REMOVED***Show diagnostic [E]rror messages***REMOVED*** })
vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>q***REMOVED***, vim.diagnostic.setloclist, { desc = ***REMOVED***Open diagnostic [Q]uick***REMOVED***x list***REMOVED*** })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set(***REMOVED***t***REMOVED***, ***REMOVED***<Esc><Esc>***REMOVED***, ***REMOVED***<C-\\><C-n>***REMOVED***, { desc = ***REMOVED***Exit terminal mode***REMOVED*** })

-- -- TIP: Disable arrow keys in normal mode
-- vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<left>***REMOVED***, '<cmd>echo ***REMOVED***Use h to move!!***REMOVED***<CR>')
-- vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<right>***REMOVED***, '<cmd>echo ***REMOVED***Use l to move!!***REMOVED***<CR>')
-- vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<up>***REMOVED***, '<cmd>echo ***REMOVED***Use k to move!!***REMOVED***<CR>')
-- vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<down>***REMOVED***, '<cmd>echo ***REMOVED***Use j to move!!***REMOVED***<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd(***REMOVED***TextYankPost***REMOVED***, {
	desc = ***REMOVED***Highlight when yanking (copying) text***REMOVED***,
	group = vim.api.nvim_create_augroup(***REMOVED***kickstart-highlight-yank***REMOVED***, { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath(***REMOVED***data***REMOVED***) .. ***REMOVED***/lazy/lazy.nvim***REMOVED***
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = ***REMOVED***https://github.com/folke/lazy.nvim.git***REMOVED***
	vim.fn.system({ ***REMOVED***git***REMOVED***, ***REMOVED***clone***REMOVED***, ***REMOVED***--***REMOVED***lter=blob:none***REMOVED***, ***REMOVED***--branch=stable***REMOVED***, lazyrepo, lazypath })
end ---@diagnostic disable-next-line: unde***REMOVED***ned-***REMOVED***eld
vim.opt.rtp:prepend(lazypath)

-- [[ Con***REMOVED***gure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require(***REMOVED***lazy***REMOVED***).setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	***REMOVED***tpope/vim-sleuth***REMOVED***, -- Detect tabstop and shiftwidth automatically

	-- NOTE: Plugins can also be added by using a table,
	-- with the ***REMOVED***rst argument being the link and the following
	-- keys can be used to con***REMOVED***gure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to force a plugin to be loaded.
	-- {
	-- 	***REMOVED***rachartier/tiny-inline-diagnostic.nvim***REMOVED***,
	-- 	event = ***REMOVED***VeryLazy***REMOVED***,
	-- 	con***REMOVED***g = function()
	-- 		require(***REMOVED***tiny-inline-diagnostic***REMOVED***).setup()
	-- 	end,
	-- },
	dev = {
		reload = true,
	},
	{ ***REMOVED***nvim-treesitter/playground***REMOVED***, cmd = ***REMOVED***TSHighlightCapturesUnderCursor***REMOVED*** },
	{ ***REMOVED***rebelot/kanagawa.nvim***REMOVED*** },
	{ ***REMOVED***catppuccin/nvim***REMOVED***, name = ***REMOVED***catppuccin***REMOVED***, priority = 1000, lazy = false },
	{
		***REMOVED***folke/snacks.nvim***REMOVED***,
		priority = 1000,
		lazy = false,
		---@type snacks.Con***REMOVED***g
		opts = snacks,
		keys = snacks.keys,
		init = function()
			vim.api.nvim_create_autocmd(***REMOVED***User***REMOVED***, {
				pattern = ***REMOVED***VeryLazy***REMOVED***,
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command

					-- Create some toggle mappings
					Snacks.toggle.option(***REMOVED***spell***REMOVED***, { name = ***REMOVED***Spelling***REMOVED*** }):map(***REMOVED***<leader>us***REMOVED***)
					Snacks.toggle.option(***REMOVED***wrap***REMOVED***, { name = ***REMOVED***Wrap***REMOVED*** }):map(***REMOVED***<leader>uw***REMOVED***)
					Snacks.toggle.option(***REMOVED***relativenumber***REMOVED***, { name = ***REMOVED***Relative Number***REMOVED*** }):map(***REMOVED***<leader>uL***REMOVED***)
					Snacks.toggle.diagnostics():map(***REMOVED***<leader>ud***REMOVED***)
					Snacks.toggle.line_number():map(***REMOVED***<leader>ul***REMOVED***)
					Snacks.toggle
						.option(***REMOVED***conceallevel***REMOVED***, { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map(***REMOVED***<leader>uc***REMOVED***)
					Snacks.toggle.treesitter():map(***REMOVED***<leader>uT***REMOVED***)
					Snacks.toggle
						.option(***REMOVED***background***REMOVED***, { off = ***REMOVED***light***REMOVED***, on = ***REMOVED***dark***REMOVED***, name = ***REMOVED***Dark Background***REMOVED*** })
						:map(***REMOVED***<leader>ub***REMOVED***)
					Snacks.toggle.inlay_hints():map(***REMOVED***<leader>uh***REMOVED***)
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
				separator = nil,
			})
		end,
	},
	{ -- optional completion source for require statements and module annotations
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
		version = ***REMOVED*******REMOVED***, -- Use for stability; omit to use `main` branch for the latest features
		event = ***REMOVED***VeryLazy***REMOVED***,
		con***REMOVED***g = function()
			require(***REMOVED***nvim-surround***REMOVED***).setup({
				-- Con***REMOVED***guration here, or leave empty to use defaults
			})
		end,
	},
	{
		***REMOVED***Wansmer/treesj***REMOVED***,
		keys = { ***REMOVED***<space>m***REMOVED***, ***REMOVED***<space>j***REMOVED***, ***REMOVED***<space>s***REMOVED*** },
		dependencies = { ***REMOVED***nvim-treesitter/nvim-treesitter***REMOVED*** }, -- if you install parsers with `nvim-treesitter`
		con***REMOVED***g = function()
			require(***REMOVED***treesj***REMOVED***).setup({ --[[ your con***REMOVED***g ]]
			})
		end,
	},
	{ ***REMOVED***nanotee/sqls.nvim***REMOVED*** },
	{ ***REMOVED***kristijanhusak/vim-dadbod-completion***REMOVED*** },
	{
		***REMOVED***kristijanhusak/vim-dadbod-ui***REMOVED***,
		dependencies = {
			{ ***REMOVED***tpope/vim-dadbod***REMOVED***, lazy = true },
			{ ***REMOVED***kristijanhusak/vim-dadbod-completion***REMOVED***, ft = { ***REMOVED***sql***REMOVED***, ***REMOVED***mysql***REMOVED***, ***REMOVED***psql***REMOVED***, ***REMOVED***mongodb***REMOVED*** } }, -- Optional
		},
		cmd = {
			***REMOVED***DBUI***REMOVED***,
			***REMOVED***DBUIToggle***REMOVED***,
			***REMOVED***DBUIAddConnection***REMOVED***,
			***REMOVED***DBUIFindBuffer***REMOVED***,
		},
		init = function()
			-- Your DBUI con***REMOVED***guration
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
	-- ***REMOVED***gc***REMOVED*** to comment visual regions/lines
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
				ensure_installed = { ***REMOVED***markdown***REMOVED***, ***REMOVED***markdown_inline***REMOVED***, ***REMOVED***r***REMOVED***, ***REMOVED***rnoweb***REMOVED***, ***REMOVED***yaml***REMOVED*** },
				highlight = { enable = true },
			})
		end,
	},
	***REMOVED***R-nvim/cmp-r***REMOVED***,

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
	{
		***REMOVED***github/copilot.vim***REMOVED***,
	},
	{
		***REMOVED***mfussenegger/nvim-dap***REMOVED***,
	},
	{
		***REMOVED***mfussenegger/nvim-dap-ui***REMOVED***,
	},
	{
		***REMOVED***folke/todo-comments.nvim***REMOVED***,
		dependencies = { ***REMOVED***nvim-lua/plenary.nvim***REMOVED*** },
	},
	{
		***REMOVED***folke/trouble.nvim***REMOVED***,
		dependencies = { ***REMOVED***nvim-tree/nvim-web-devicons***REMOVED*** },
	},
	{
		***REMOVED***nvim-lualine/lualine.nvim***REMOVED***,
		dependencies = { ***REMOVED***nvim-tree/nvim-web-devicons***REMOVED*** },
	},
	{
		***REMOVED***wakatime/vim-wakatime***REMOVED***,
	},

	{
		***REMOVED***tpope/vim-dadbod***REMOVED***,
	},
	{ ***REMOVED***akinsho/bufferline.nvim***REMOVED***, version = ***REMOVED*******REMOVED***, dependencies = ***REMOVED***nvim-tree/nvim-web-devicons***REMOVED*** },
	{
		***REMOVED***nvim-tree/nvim-tree.lua***REMOVED***,
		version = ***REMOVED*******REMOVED***,
		lazy = false,
		dependencies = {
			***REMOVED***nvim-tree/nvim-web-devicons***REMOVED***,
		},
		con***REMOVED***g = function()
			require(***REMOVED***nvim-tree***REMOVED***).setup({})
		end,
	},

	{
		***REMOVED***kdheepak/lazygit.nvim***REMOVED***,
		cmd = {
			***REMOVED***LazyGit***REMOVED***,
			***REMOVED***LazyGitCon***REMOVED***g***REMOVED***,
			***REMOVED***LazyGitCurrentFile***REMOVED***,
			***REMOVED***LazyGitFilter***REMOVED***,
			***REMOVED***LazyGitFilterCurrentFile***REMOVED***,
		},
		-- optional for floating window border decoration
		dependencies = {
			***REMOVED***nvim-lua/plenary.nvim***REMOVED***,
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the ***REMOVED***rst time
		keys = {
			{ ***REMOVED***<leader>lg***REMOVED***, ***REMOVED***<cmd>LazyGit<cr>***REMOVED***, desc = ***REMOVED***LazyGit***REMOVED*** },
		},
	},
	{
		***REMOVED***windwp/nvim-autopairs***REMOVED***,
		event = ***REMOVED***InsertEnter***REMOVED***,
		con***REMOVED***g = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	{
		***REMOVED***nvimdev/dashboard-nvim***REMOVED***,
		event = ***REMOVED***vimEnter***REMOVED***,
		requires = {
			***REMOVED***nvim-tree/nvim-web-devicons***REMOVED***,
		},
	}, -- lazy.nvim
	{ ***REMOVED***MunifTanjim/nui.nvim***REMOVED*** },
	{ ***REMOVED***rcarriga/nvim-notify***REMOVED*** },
	{ ***REMOVED***tpope/vim-fugitive***REMOVED*** },
	{
		***REMOVED***folke/noice.nvim***REMOVED***,
		event = ***REMOVED***VeryLazy***REMOVED***,
		dependencies = {
			***REMOVED***MunifTanjim/nui.nvim***REMOVED***,
			***REMOVED***rcarriga/nvim-notify***REMOVED***,
		},
	},
	{
		***REMOVED***cdelledonne/vim-cmake***REMOVED***,
	},
	--	{
	--	***REMOVED***jose-elias-alvarez/null-ls.nvim***REMOVED***,
	--	},
	{
		***REMOVED***mbbill/undotree***REMOVED***,
	},
	-- Here is a more advanced example where we pass con***REMOVED***guration
	-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
	--    require('gitsigns').setup({ ... })
	--
	-- See `:help gitsigns` to understand what the con***REMOVED***guration keys do
	{ ***REMOVED***lewis6991/gitsigns.nvim***REMOVED*** },

	-- NOTE: Plugins can also be con***REMOVED***gured to run Lua code when they are loaded.
	--
	-- NOTE: Plugins can specify dependencies.
	--
	-- The dependencies are proper plugin speci***REMOVED***cations as well - anything
	-- you do for a plugin at the top level, you can do for a dependency.
	--
	-- Use the `dependencies` key to specify the dependencies of a particular plugin

	{ -- Fuzzy Finder (***REMOVED***les, lsp, etc)
		***REMOVED***nvim-telescope/telescope.nvim***REMOVED***,
		event = ***REMOVED***vimEnter***REMOVED***,
		branch = ***REMOVED***0.1.x***REMOVED***,
		dependencies = {
			***REMOVED***nvim-lua/plenary.nvim***REMOVED***,
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				***REMOVED***nvim-telescope/telescope-fzf-native.nvim***REMOVED***,

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = ***REMOVED***make***REMOVED***,

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable(***REMOVED***make***REMOVED***) == 1
				end,
			},
			{ ***REMOVED***nvim-telescope/telescope-ui-select.nvim***REMOVED*** },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ ***REMOVED***nvim-tree/nvim-web-devicons***REMOVED***, enabled = vim.g.have_nerd_font },
		},
		con***REMOVED***g = function()
			--

			-- [[ Con***REMOVED***gure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require(***REMOVED***telescope***REMOVED***).setup({
				-- defaults = {
				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_re***REMOVED***ne' },
				--   },
				-- },
				-- pickers = {}
				extensions = {
					[***REMOVED***ui-select***REMOVED***] = {
						require(***REMOVED***telescope.themes***REMOVED***).get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require(***REMOVED***telescope***REMOVED***).load_extension, ***REMOVED***fzf***REMOVED***)
			pcall(require(***REMOVED***telescope***REMOVED***).load_extension, ***REMOVED***ui-select***REMOVED***)
			pcall(require(***REMOVED***telescope***REMOVED***).load_extension, ***REMOVED***noice***REMOVED***)
			pcall(require(***REMOVED***telescope***REMOVED***).load_extension, ***REMOVED***lazygit***REMOVED***)

			-- See `:help telescope.builtin`
			local builtin = require(***REMOVED***telescope.builtin***REMOVED***)
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>sh***REMOVED***, builtin.help_tags, { desc = ***REMOVED***[S]earch [H]elp***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>sk***REMOVED***, builtin.keymaps, { desc = ***REMOVED***[S]earch [K]eymaps***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>ss***REMOVED***, builtin.builtin, { desc = ***REMOVED***[S]earch [S]elect Telescope***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>sw***REMOVED***, builtin.grep_string, { desc = ***REMOVED***[S]earch current [W]ord***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***lg***REMOVED***, builtin.live_grep, { desc = ***REMOVED***[S]earch by [G]rep***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>sd***REMOVED***, builtin.diagnostics, { desc = ***REMOVED***[S]earch [D]iagnostics***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>sr***REMOVED***, builtin.resume, { desc = ***REMOVED***[S]earch [R]esume***REMOVED*** })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>s.***REMOVED***, builtin.old***REMOVED***les, { desc = '[S]earch Recent Files (***REMOVED***.***REMOVED*** for repeat)' })
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***re***REMOVED***, builtin.buffers, { desc = ***REMOVED***[ ] Find existing buffers***REMOVED*** })

			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>f***REMOVED***, function()
				require(***REMOVED***telescope.builtin***REMOVED***).***REMOVED***nd_***REMOVED***les({
					***REMOVED***nd_command = { ***REMOVED***rg***REMOVED***, ***REMOVED***--ignore***REMOVED***, ***REMOVED***--hidden***REMOVED***, ***REMOVED***--***REMOVED***les***REMOVED***, ***REMOVED***--glob***REMOVED***, ***REMOVED***!**/.git/****REMOVED***, ***REMOVED***--no-ignore***REMOVED*** },
				})
			end, { noremap = true, silent = true })
			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>/***REMOVED***, function()
				-- You can pass additional con***REMOVED***guration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_***REMOVED***nd(require(***REMOVED***telescope.themes***REMOVED***).get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = ***REMOVED***[/] Fuzzily search in current buffer***REMOVED*** })

			-- It's also possible to pass additional con***REMOVED***guration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>s/***REMOVED***, function()
				builtin.live_grep({
					grep_open_***REMOVED***les = true,
					prompt_title = ***REMOVED***Live Grep in Open Files***REMOVED***,
				})
			end, { desc = ***REMOVED***[S]earch [/] in Open Files***REMOVED*** })

			-- Shortcut for searching your Neovim con***REMOVED***guration ***REMOVED***les
			vim.keymap.set(***REMOVED***n***REMOVED***, ***REMOVED***<leader>sn***REMOVED***, function()
				builtin.***REMOVED***nd_***REMOVED***les({ cwd = vim.fn.stdpath(***REMOVED***con***REMOVED***g***REMOVED***) })
			end, { desc = ***REMOVED***[S]earch [N]eovim ***REMOVED***les***REMOVED*** })
		end,
	},
	--
	{
		dir = ***REMOVED***/home/urizen/rescue-lsp***REMOVED***,
		name = ***REMOVED***rescue-lsp***REMOVED***,
		con***REMOVED***g = function()
			require(***REMOVED***rescue-lsp***REMOVED***).setup()
		end,
	},
	-- {
	-- 	***REMOVED***urizennnn/rescue-lsp.nvim***REMOVED***,
	-- 	con***REMOVED***g = function()
	-- 		require(***REMOVED***rescue-lsp***REMOVED***).setup()
	-- 	end,
	-- },
	{ -- LSP Con***REMOVED***guration & Plugins
		***REMOVED***neovim/nvim-lspcon***REMOVED***g***REMOVED***,
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			***REMOVED***williamboman/mason.nvim***REMOVED***,
			***REMOVED***williamboman/mason-lspcon***REMOVED***g.nvim***REMOVED***,
			***REMOVED***WhoIsSethDaniel/mason-tool-installer.nvim***REMOVED***,

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('***REMOVED***dget').setup({})`
			{ ***REMOVED***j-hui/***REMOVED***dget.nvim***REMOVED***, opts = {} },
		},
		con***REMOVED***g = function()
			vim.api.nvim_create_autocmd(***REMOVED***LspAttach***REMOVED***, {
				group = vim.api.nvim_create_augroup(***REMOVED***kickstart-lsp-attach***REMOVED***, { clear = true }),
				callback = function(event)
					-- NOTE: Remember that Lua is a real programming language, and as such it is possible
					-- to de***REMOVED***ne small helper and utility functions so you don't have to repeat yourself.
					--
					-- In this case, we create a function that lets us more easily de***REMOVED***ne mappings speci***REMOVED***c
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc)
						vim.keymap.set(***REMOVED***n***REMOVED***, keys, func, { buffer = event.buf, desc = ***REMOVED***LSP: ***REMOVED*** .. desc })
					end

					-- Jump to the de***REMOVED***nition of the word under your cursor.
					--  This is where a variable was ***REMOVED***rst declared, or where a function is de***REMOVED***ned, etc.
					--  To jump back, press <C-t>.
					map(***REMOVED***gd***REMOVED***, require(***REMOVED***telescope.builtin***REMOVED***).lsp_de***REMOVED***nitions, ***REMOVED***[G]oto [D]e***REMOVED***nition***REMOVED***)

					-- Find references for the word under your cursor.
					map(***REMOVED***gr***REMOVED***, require(***REMOVED***telescope.builtin***REMOVED***).lsp_references, ***REMOVED***[G]oto [R]eferences***REMOVED***)

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map(***REMOVED***gI***REMOVED***, require(***REMOVED***telescope.builtin***REMOVED***).lsp_implementations, ***REMOVED***[G]oto [I]mplementation***REMOVED***)

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the de***REMOVED***nition of its *type*, not where it was *de***REMOVED***ned*.
					map(***REMOVED***<leader>D***REMOVED***, require(***REMOVED***telescope.builtin***REMOVED***).lsp_type_de***REMOVED***nitions, ***REMOVED***Type [D]e***REMOVED***nition***REMOVED***)

					-- Fuzzy ***REMOVED***nd all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map(***REMOVED***<leader>ds***REMOVED***, require(***REMOVED***telescope.builtin***REMOVED***).lsp_document_symbols, ***REMOVED***[D]ocument [S]ymbols***REMOVED***)

					-- Fuzzy ***REMOVED***nd all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					map(
						***REMOVED***<leader>ws***REMOVED***,
						require(***REMOVED***telescope.builtin***REMOVED***).lsp_dynamic_workspace_symbols,
						***REMOVED***[W]orkspace [S]ymbols***REMOVED***
					)

					-- Rename the variable under your cursor.
					--  Most Language Servers support renaming across ***REMOVED***les, etc.
					map(***REMOVED***<leader>rn***REMOVED***, vim.lsp.buf.rename, ***REMOVED***[R]e[n]ame***REMOVED***)

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map(***REMOVED***<leader>ca***REMOVED***, vim.lsp.buf.code_action, ***REMOVED***[C]ode [A]ction***REMOVED***)

					-- Opens a popup that displays documentation about the word under your cursor
					--  See `:help K` for why this keymap.
					map(***REMOVED***K***REMOVED***, vim.lsp.buf.hover, ***REMOVED***Hover Documentation***REMOVED***)

					-- WARN: This is not Goto De***REMOVED***nition, this is Goto Declaration.
					--  For example, in C this would take you to the header.
					map(***REMOVED***gD***REMOVED***, vim.lsp.buf.declaration, ***REMOVED***[G]oto [D]eclaration***REMOVED***)

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend(***REMOVED***force***REMOVED***, capabilities, require(***REMOVED***cmp_nvim_lsp***REMOVED***).default_capabilities())
			local servers = {
				-- clangd = {},
				gopls = {},
				pyright = {},
				ts_ls = {},
				golangci_lint_ls = {},
				lua_ls = {
					-- cmd = {...},
					-- ***REMOVED***letypes = { ...},
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = ***REMOVED***Replace***REMOVED***,
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-***REMOVED***elds` warnings
							-- diagnostics = { disable = { 'missing-***REMOVED***elds' } },
						},
					},
				},
			}
			require(***REMOVED***mason***REMOVED***).setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				***REMOVED***stylua***REMOVED***, -- Used to format Lua code
			})
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

	{ -- Autoformat
		***REMOVED***stevearc/conform.nvim***REMOVED***,
		lazy = false,
		keys = {
			{
				***REMOVED***<leader>b***REMOVED***,
				function()
					require(***REMOVED***conform***REMOVED***).format({ async = true, lsp_fallback = true })
				end,
				mode = ***REMOVED******REMOVED***,
				desc = ***REMOVED***[F]ormat buffer***REMOVED***,
			},
		},

		---@type conform.setupOpts
		opts = {
			format_on_save = function(bufnr)
				local disable_***REMOVED***letypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_***REMOVED***letypes[vim.bo[bufnr].***REMOVED***letype],
				}
			end,
			format_after_save = {
				lsp_format = ***REMOVED***fallback***REMOVED***,
			},
			notify_no_formatters = true,
			formatters_by_ft = {
				lua = { ***REMOVED***stylua***REMOVED*** },
				-- Conform can also run multiple formatters sequentially
				python = { ***REMOVED***isort***REMOVED***, ***REMOVED***black***REMOVED*** },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				javascript = { { ***REMOVED***prettierd***REMOVED***, ***REMOVED***prettier***REMOVED*** } },
			},
		},
	},
	{
		***REMOVED***mrcjkb/rustaceanvim***REMOVED***,
		version = ***REMOVED***^4***REMOVED***, -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{ -- Autocompletion
		***REMOVED***hrsh7th/nvim-cmp***REMOVED***,
		event = ***REMOVED***InsertEnter***REMOVED***,
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				***REMOVED***L3MON4D3/LuaSnip***REMOVED***,
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has(***REMOVED***win32***REMOVED***) == 1 or vim.fn.executable(***REMOVED***make***REMOVED***) == 0 then
						return
					end
					return ***REMOVED***make install_jsregexp***REMOVED***
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   con***REMOVED***g = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
			},
			***REMOVED***saadparwaiz1/cmp_luasnip***REMOVED***,

			***REMOVED***hrsh7th/cmp-nvim-lsp***REMOVED***,
			***REMOVED***hrsh7th/cmp-path***REMOVED***,
		},
		con***REMOVED***g = function()
			-- See `:help cmp`
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

				-- For an understanding of why these mappings were
				-- chosen, you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					[***REMOVED***<C-n>***REMOVED***] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					[***REMOVED***<C-p>***REMOVED***] = cmp.mapping.select_prev_item(),

					-- Scroll the documentation window [b]ack / [f]orward
					[***REMOVED***<C-b>***REMOVED***] = cmp.mapping.scroll_docs(-4),
					[***REMOVED***<C-f>***REMOVED***] = cmp.mapping.scroll_docs(4),

					-- Accept ([y]es) the completion.
					--  This will auto-import if your LSP supports it.
					--  This will expand snippets if the LSP sent a snippet.
					[***REMOVED***<C-y>***REMOVED***] = cmp.mapping.con***REMOVED***rm({ select = true }),

					-- Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					[***REMOVED***<C-Space>***REMOVED***] = cmp.mapping.complete({}),

					-- Think of <c-l> as moving to the right of your snippet expansion.
					--  So if you have a snippet that's like:
					--  function $name($args)
					--    $body
					--  end
					--
					-- <c-l> will move you to the right of each of the expansion locations.
					-- <c-h> is similar, except moving you backwards.
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

					-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
					--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-***REMOVED***le#keymaps
				}),
				sources = {
					{ name = ***REMOVED***nvim_lsp***REMOVED*** },
					{ name = ***REMOVED***luasnip***REMOVED*** },
					{ name = ***REMOVED***path***REMOVED*** },
				},
			})
		end,
	},

	{
		***REMOVED***folke/tokyonight.nvim***REMOVED***,
		priority = 1000, -- Make sure to load this before all the other start plugins.
		init = function()
			vim.cmd.colorscheme(***REMOVED***tokyonight***REMOVED***)
			vim.cmd.hi(***REMOVED***Comment gui=none***REMOVED***)
		end,
		con***REMOVED***g = function()
			require(***REMOVED***folke***REMOVED***)
		end,
	},

	-- Highlight todo, notes, etc in comments
	{
		***REMOVED***folke/todo-comments.nvim***REMOVED***,
		event = ***REMOVED***vimEnter***REMOVED***,
		dependencies = { ***REMOVED***nvim-lua/plenary.nvim***REMOVED*** },
		opts = { signs = false },
	},

	{ -- Collection of various small independent plugins/modules
		***REMOVED***echasnovski/mini.nvim***REMOVED***,
		con***REMOVED***g = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require(***REMOVED***mini.ai***REMOVED***).setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- -i saiw) - [S]urround [A]dd [I]nner [W]ord [)]Pareni
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require(***REMOVED***mini.surround***REMOVED***).setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and strys some other statusline plugin
			local statusline = require(***REMOVED***mini.statusline***REMOVED***)
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can con***REMOVED***gure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-***REMOVED***eld
			statusline.section_location = function()
				return ***REMOVED***%2l:%-2v***REMOVED***
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
	{ -- Highlight, edit, and navigate code
		***REMOVED***nvim-treesitter/nvim-treesitter***REMOVED***,
		build = ***REMOVED***:TSUpdate***REMOVED***,
		opts = {
			ensure_installed = {
				***REMOVED***bash***REMOVED***,
				***REMOVED***c***REMOVED***,
				***REMOVED***html***REMOVED***,
				***REMOVED***lua***REMOVED***,
				***REMOVED***luadoc***REMOVED***,
				***REMOVED***markdown***REMOVED***,
				***REMOVED***vim***REMOVED***,
				***REMOVED***vimdoc***REMOVED***,
				***REMOVED***javascript***REMOVED***,
				***REMOVED***typescript***REMOVED***,
				***REMOVED***cpp***REMOVED***,
				***REMOVED***kotlin***REMOVED***,
			},
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { ***REMOVED***ruby***REMOVED*** },
			},
			indent = { enable = true, disable = { ***REMOVED***ruby***REMOVED*** } },
		},
		con***REMOVED***g = function(_, opts)
			-- [[ Con***REMOVED***gure Treesitter ]] See `:help nvim-treesitter`

			---@diagnostic disable-next-line: missing-***REMOVED***elds
			require(***REMOVED***nvim-treesitter.con***REMOVED***gs***REMOVED***).setup(opts)

			-- There are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. You should go explore a few and see what interests you:
			--
			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},
	--
	-- require(***REMOVED***kickstart.plugins.debug***REMOVED***),
	-- require(***REMOVED***kickstart.plugins.indent_line***REMOVED***),
	-- require(***REMOVED***kickstart.plugins.lint***REMOVED***),
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim de***REMOVED***ned Nerd Font icons, otherwise de***REMOVED***ne a unicode icons table
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
