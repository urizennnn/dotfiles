local cmp = require("cmp")
local luasnip = require("luasnip")

-- Main setup configuration
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<Enter>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "emoji" },
		{ name = "crates" },
		{ name = "lazydev", group_index = 0 },
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = require("nvim-highlight-colors").format,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = true,
	},
}) -- LSP capabilities for nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with the name of each LSP server
require("lspconfig")["lua_ls"].setup({
	capabilities = capabilities,
})
cmp.config.formatting = {
	format = require("tailwindcss-colorizer-cmp").formatter,
}
