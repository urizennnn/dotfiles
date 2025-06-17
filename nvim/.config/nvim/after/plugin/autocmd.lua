local function prisma_generate_and_reload_lsp()
	vim.fn.jobstart({ "npx", "prisma", "generate" }, {
		cwd = vim.fn.getcwd(),
		stdout_buffered = true,
		stderr_buffered = true,
		on_stdout = function(_, data)
			if data and #data > 0 then
				vim.notify(table.concat(data, "\n"), vim.log.levels.INFO, { title = "Prisma Generate" })
			end
		end,
		on_stderr = function(_, data)
			if data and #data > 0 then
				vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR, { title = "Prisma Generate (Error)" })
			end
		end,
		on_exit = function()
			for _, client in pairs(vim.lsp.get_active_clients()) do
				if client.name then
					vim.lsp.stop_client(client.id)
				end
			end
			vim.cmd("edit") -- triggers LSP restart on reopened buffer
			vim.notify("LSPs restarted", vim.log.levels.INFO, { title = "Prisma Generate" })
		end,
	})
end

vim.keymap.set("n", "pg", prisma_generate_and_reload_lsp, { desc = "Run `npx prisma generate` and reload LSPs" })
