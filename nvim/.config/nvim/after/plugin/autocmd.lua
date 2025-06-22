local function prisma_generate_and_reload_lsp()
	local clients_to_restart = {}
	for _, client in ipairs(vim.lsp.get_active_clients()) do
		table.insert(clients_to_restart, client.id)
	end

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
			for _, id in ipairs(clients_to_restart) do
				pcall(vim.lsp.stop_client, id, true)
			end
			vim.schedule(function()
				for _, id in ipairs(clients_to_restart) do
					vim.cmd("LspStart " .. id)
				end
				vim.notify("LSPs restarted", vim.log.levels.INFO, { title = "Prisma Generate" })
			end)
		end,
	})
end

vim.keymap.set(
	"n",
	"pg",
	prisma_generate_and_reload_lsp,
	{ desc = "Run `npx prisma generate` then restart active LSPs" }
)
