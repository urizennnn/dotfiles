require(***REMOVED***conform***REMOVED***).setup({
	formatters_by_ft = {
		lua = { ***REMOVED***stylua***REMOVED*** },
		python = { ***REMOVED***isort***REMOVED***, ***REMOVED***black***REMOVED*** },
		rust = { ***REMOVED***rustfmt***REMOVED***, lsp_format = ***REMOVED***fallback***REMOVED*** },
		javascript = { ***REMOVED***prettierd***REMOVED***, ***REMOVED***prettier***REMOVED***, stop_after_***REMOVED***rst = true },
		typescript = { ***REMOVED***prettierd***REMOVED***, ***REMOVED***prettier***REMOVED***, stop_after_***REMOVED***rst = true },
		go = { ***REMOVED***gofmt***REMOVED***, ***REMOVED***gofumpt***REMOVED*** },
	},
})
