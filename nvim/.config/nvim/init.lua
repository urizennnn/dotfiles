require("set")
local fzf_opts, fzf_keymap = dofile(vim.fn.stdpath("config") .. "/after/plugin/fzf_lua.lua")
local snacks = require("plugin-config.snacks")

vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = "#808080" })
vim.lsp.set_log_level("debug")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-sleuth",
	dev = { reload = true },
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "LazyVim", words = { "LazyVim" } },
			},
		},
	},
	{ "brenoprata10/nvim-highlight-colors" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "ahmedkhalf/project.nvim" },
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{ "augmentcode/augment.vim" },
	{
		"ibhagwan/fzf-lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"sharkdp/fd", -- blazing-fast file search
			"junegunn/fzf", -- finder core
			"BurntSushi/ripgrep", -- grep provider
			"dandavison/delta",
			"nvim-treesitter/nvim-treesitter-context", -- ✗ typo fixed
			"hpjansson/chafa",
			"atanunq/viu",
		},
		keys = fzf_keymap,
		opts = fzf_opts,
		config = function(_, opts)
			local fzf = require("fzf-lua")
			fzf.setup(opts) -- respect everything in fzf_opts
			fzf.register_ui_select() -- explicit call keeps other plugins happy
		end,
	},

	{ "akinsho/flutter-tools.nvim", ft = { "dart", "flutter" } },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{ "nvim-treesitter/playground", cmd = "TSHighlightCapturesUnderCursor" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = snacks,
		keys = snacks.keys,
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					_G.dd = function(...)
						require("plugin-config.snacks").debug.inspect(...)
					end
					_G.bt = function()
						require("plugin-config.snacks").debug.backtrace()
					end
					vim.print = _G.dd
					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					Snacks.toggle.diagnostics():map("<leader>ud")
					Snacks.toggle.line_number():map("<leader>ul")
					Snacks.toggle
						.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map("<leader>uc")
					Snacks.toggle.treesitter():map("<leader>uT")
					Snacks.toggle
						.option("background", { off = "light", on = "dark", name = "Dark Background" })
						:map("<leader>ub")
					Snacks.toggle.inlay_hints():map("<leader>uh")
				end,
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 3,
				trim_scope = "outer",
				mode = "cursor",
				line_numbers = true,
				multiwindow = true,
			})
		end,
	},
	{
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
	{ "rcarriga/nvim-notify" },
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"Wansmer/treesj",
		keys = { "<space>m", "<space>j", "<space>s" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup()
		end,
	},
	{ "nanotee/sqls.nvim" },
	{ "kristijanhusak/vim-dadbod-completion" },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "psql", "mongodb" } },
		},
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_icons = {
				expanded = "▾",
				collapsed = "▸",
				saved_query = "*",
				new_query = "+",
				tables = "~",
				buffers = "»",
				connection_ok = "✓",
				connection_error = "✕",
			}
			vim.g.db_ui_disable_progress_bar = 1
		end,
	},
	{ "rmagatti/auto-session", config = true },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{ "mistricky/codesnap.nvim", build = "make " },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"barrett-ruth/live-server.nvim",
		build = "pnpm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ignore_install = { "haskell" },
				auto_install = true,
				sync_install = true,
				ensure_installed = { "markdown", "markdown_inline", "yaml" },
				highlight = { enable = true },
			})
		end,
	},
	{
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{ "f-person/git-blame.nvim" },
	{ "github/copilot.vim" },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "tpope/vim-dadbod" },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
	},
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{ "nvimdev/dashboard-nvim", event = "vimEnter", requires = { "nvim-tree/nvim-web-devicons" } },
	{ "MunifTanjim/nui.nvim" },
	{ "rcarriga/nvim-notify" },
	{ "tpope/vim-fugitive" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	},
	{ "cdelledonne/vim-cmake" },
	{ "mbbill/undotree" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged_enable = true,
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true,
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},
	{ "dmmulroy/ts-error-translator.nvim" },
	-- tailwind-tools.lua
	-- {
	-- 	"luckasRanarison/tailwind-tools.nvim",
	-- 	name = "tailwind-tools",
	-- 	build = ":UpdateRemotePlugins",
	-- 	dependencies = {},
	-- 	opts = {}, -- your configuration
	-- },
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
	{
		"urizennnn/rescue-lsp.nvim",
		config = function()
			require("rescue-lsp").setup()
		end,
	},
	{ "onsails/lspkind.nvim" },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"saghen/blink.cmp",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			local auto_format = true -- set/override elsewhere if needed

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

			local servers = {
				pyright = {},
				ts_ls = {},
				eslint = {
					settings = {
						workingDirectories = { mode = "auto" },
						format = auto_format,
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
						},
					},
				},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, { "stylua" })

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					eslint = function()
						if not auto_format then
							return
						end

						local function get_client(buf)
							return LazyVim.lsp.get_clients({ name = "eslint", bufnr = buf })[1]
						end

						local formatter = LazyVim.lsp.formatter({
							name = "eslint: lsp",
							primary = false,
							priority = 200,
							filter = "eslint",
						})

						if not pcall(require, "vim.lsp._dynamic") then
							formatter.name = "eslint: EslintFixAll"
							formatter.sources = function(buf)
								local client = get_client(buf)
								return client and { "eslint" } or {}
							end
							formatter.format = function(buf)
								local client = get_client(buf)
								if client then
									local diag = vim.diagnostic.get(
										buf,
										{ namespace = vim.lsp.diagnostic.get_namespace(client.id) }
									)
									if #diag > 0 then
										vim.cmd("EslintFixAll")
									end
								end
							end
						end

						LazyVim.format.register(formatter)

						local server = servers.eslint or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig").eslint.setup(server)
					end,

					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>b",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return { timeout_ms = 500, lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype] }
			end,
			format_after_save = { lsp_format = "fallback" },
			notify_no_formatters = true,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
			},
		},
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		lazy = false,
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none",
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<Enter>"] = { "accept", "fallback" },
				["<C-y>"] = { "accept", "fallback" },
				["<Esc>"] = { "hide", "fallback" },
				["<C-p>"] = { "select_prev", "fallback_to_mappings" },
				["<C-n>"] = { "select_next", "fallback_to_mappings" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},
			appearance = {
				nerd_font_variant = "normal",
			},
			signature = {
				window = {
					border = "rounded",
					treesitter_highlighting = true,
					show_documentation = true,
				},
				enabled = true,
			},
			completion = {
				trigger = {
					prefetch_on_insert = true,
					show_on_backspace_in_keyword = true,
					show_on_backspace_after_accept = true,
					show_on_insert = true,
					-- Add these for better auto-import behavior
					show_in_snippet = true,
				},
				-- Add accept configuration for better auto-import
				accept = {
					auto_brackets = {
						enabled = true,
					},
					create_undo_point = true,
				},
				-- Add list configuration for better performance
				list = {
					max_items = 200,
					selection = {
						preselect = true,
						auto_insert = true,
					},
					cycle = {
						from_bottom = true,
						from_top = true,
					},
				},
				ghost_text = {
					enabled = false,
					show_with_selection = true,
					show_without_selection = false,
					show_with_menu = true,
					show_without_menu = true,
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200, -- Reduced from 500ms for faster response
					treesitter_highlighting = true,
					window = {
						border = "rounded",
						max_width = 80,
						max_height = 20,
					},
				},
				menu = {
					-- Add auto_show for immediate menu display
					auto_show = true,
					draw = {
						-- Add treesitter for better syntax highlighting
						treesitter = { "lsp" },
						-- Add columns for more information
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind", gap = 1 },
							{ "source_name" },
						},
						components = {
							kind_icon = {
								text = function(ctx)
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = require("lspkind").symbolic(ctx.kind, {
											mode = "symbol",
										})
									end
									return icon .. ctx.icon_gap
								end,
								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							},
						},
					},
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				-- Add provider configuration for better control
				providers = {
					lsp = {
						name = "LSP",
						module = "blink.cmp.sources.lsp",
						enabled = true,
						-- Prioritize LSP completions
						score_offset = 100,
					},
					path = {
						name = "Path",
						module = "blink.cmp.sources.path",
						score_offset = 3,
						opts = {
							trailing_slash = false,
							label_trailing_slash = true,
							get_cwd = function(context)
								return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
							end,
							show_hidden_files_by_default = false,
						},
					},
					snippets = {
						name = "Snippets",
						module = "blink.cmp.sources.snippets",
						score_offset = 80, -- High priority for snippets
					},
					buffer = {
						name = "Buffer",
						module = "blink.cmp.sources.buffer",
						enabled = true,
						score_offset = -5,
						opts = {
							get_bufnrs = function()
								return vim.api.nvim_list_bufs()
							end,
						},
					},
				},
				per_filetype = {
					lua = { "lsp", "path", "snippets", "buffer" },
					vim = { "lsp", "cmdline", "path" },
					-- Add specific config for JS/TS files
					javascript = { "lsp", "path", "snippets", "buffer" },
					typescript = { "lsp", "path", "snippets", "buffer" },
					javascriptreact = { "lsp", "path", "snippets", "buffer" },
					typescriptreact = { "lsp", "path", "snippets", "buffer" },
				},
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
				-- Add sorting configuration for better results
				sorts = { "score", "sort_text", "kind" },
			},
		},
		opts_extend = { "sources.default" },
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("tokyonight")
			vim.cmd.hi("Comment gui=none")
		end,
		config = function()
			require("folke")
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "vimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
			require("mini.indentscope").setup({
				draw = {
					delay = 100,
				},
				options = { try_as_border = true, border = "both" },
			})
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
