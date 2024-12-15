local cmp = require ***REMOVED***cmp***REMOVED***
    local luasnip = require ***REMOVED***luasnip***REMOVED***

    -- Main setup con***REMOVED***guration
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        [***REMOVED***<C-n>***REMOVED***] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        [***REMOVED***<C-p>***REMOVED***] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        [***REMOVED***<Enter>***REMOVED***] = cmp.mapping.con***REMOVED***rm { behavior = cmp.Con***REMOVED***rmBehavior.Insert, select = true },
        [***REMOVED***<C-d>***REMOVED***] = cmp.mapping.scroll_docs(-4),
        [***REMOVED***<C-f>***REMOVED***] = cmp.mapping.scroll_docs(4),
      },
      sources = {
        { name = ***REMOVED***nvim_lsp***REMOVED*** },
        { name = ***REMOVED***nvim_lua***REMOVED*** },
        { name = ***REMOVED***luasnip***REMOVED*** },
        { name = ***REMOVED***buffer***REMOVED*** },
        { name = ***REMOVED***path***REMOVED*** },
        { name = ***REMOVED***emoji***REMOVED*** },
        { name = ***REMOVED***crates***REMOVED*** },
        { name = ***REMOVED***lazydev***REMOVED***, group_index = 0 },
      },
      formatting = {
        ***REMOVED***elds = { ***REMOVED***kind***REMOVED***, ***REMOVED***abbr***REMOVED***, ***REMOVED***menu***REMOVED*** },
        format = function(entry, vim_item)
          local kind_icons = {
            Text = ***REMOVED***󰉿***REMOVED***, Method = ***REMOVED***m***REMOVED***, Function = ***REMOVED***󰊕***REMOVED***, Constructor = ***REMOVED******REMOVED***,
            Field = ***REMOVED******REMOVED***, Variable = ***REMOVED***󰆧***REMOVED***, Class = ***REMOVED***󰌗***REMOVED***, Interface = ***REMOVED******REMOVED***,
            Module = ***REMOVED******REMOVED***, Property = ***REMOVED******REMOVED***, Unit = ***REMOVED******REMOVED***, Value = ***REMOVED***󰎠***REMOVED***,
            Enum = ***REMOVED******REMOVED***, Keyword = ***REMOVED***󰌋***REMOVED***, Snippet = ***REMOVED******REMOVED***, Color = ***REMOVED***󰏘***REMOVED***,
            File = ***REMOVED***󰈙***REMOVED***, Reference = ***REMOVED******REMOVED***, Folder = ***REMOVED***󰉋***REMOVED***, EnumMember = ***REMOVED******REMOVED***,
            Constant = ***REMOVED***󰇽***REMOVED***, Struct = ***REMOVED******REMOVED***, Event = ***REMOVED******REMOVED***, Operator = ***REMOVED***󰆕***REMOVED***,
            TypeParameter = ***REMOVED***󰊄***REMOVED***, Codeium = ***REMOVED***󰚩***REMOVED***, Copilot = ***REMOVED******REMOVED***,
          }
          vim_item.kind = string.format(***REMOVED***%s %s***REMOVED***, kind_icons[vim_item.kind] or ***REMOVED******REMOVED***, vim_item.kind)
          vim_item.menu = ({
            nvim_lsp = ***REMOVED***[LSP]***REMOVED***, nvim_lua = ***REMOVED***[Lua]***REMOVED***, luasnip = ***REMOVED***[Snip]***REMOVED***,
            buffer = ***REMOVED***[Buf]***REMOVED***, path = ***REMOVED***[Path]***REMOVED***, emoji = ***REMOVED***[Emoji]***REMOVED***,
            crates = ***REMOVED***[Crates]***REMOVED***,
          })[entry.source.name]
          return vim_item
        end,
      },
      window = {
        completion = cmp.con***REMOVED***g.window.bordered(),
        documentation = cmp.con***REMOVED***g.window.bordered(),
      },
      experimental = {
        ghost_text = true,
      },
    })   -- LSP capabilities for nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with the name of each LSP server
require('lspcon***REMOVED***g')['lua_ls'].setup {
  capabilities = capabilities
}
