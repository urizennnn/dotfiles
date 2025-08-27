
vim.api.nvim_create_user_command("LspDebug", function()
	print("=== LSP Debug Info ===")

	local buf = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = buf })

	print("Current buffer:", buf)
	print("File type:", vim.bo.filetype)
	print("File name:", vim.api.nvim_buf_get_name(buf))

	if #clients == 0 then
		print("No LSP clients attached to current buffer")
	else
		print("Attached LSP clients:")
		for _, client in ipairs(clients) do
			print("  - " .. client.name .. " (id: " .. client.id .. ")")
			print("    Root dir: " .. (client.config.root_dir or "unknown"))
		end
	end

	print("Available LSP clients:")
	local all_clients = vim.lsp.get_clients()
	for _, client in ipairs(all_clients) do
		print("  - " .. client.name)
	end

	print("Mason LSP servers:")
	local ok, mason_registry = pcall(require, "mason-registry")
	if ok then
		local installed = mason_registry.get_installed_packages()
		for _, pkg in ipairs(installed) do
			if pkg.spec.categories and vim.tbl_contains(pkg.spec.categories, "LSP") then
				print("  - " .. pkg.name)
			end
		end
	end
end, {})

vim.api.nvim_create_user_command("LspRestart", function()
	local buf = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = buf })

	for _, client in ipairs(clients) do
		print("Stopping client: " .. client.name)
		vim.lsp.stop_client(client.id, true)
	end

	vim.defer_fn(function()
		vim.cmd("edit") 
		print("LSP clients restarted")
	end, 500)
end, {})

vim.api.nvim_create_user_command("CheckVtsls", function()
	print("=== VTSLS Check ===")

	local handle = io.popen("which vtsls")
	if handle then
		local result = handle:read("*a")
		handle:close()
		if result and result ~= "" then
			print("VTSLS binary found at:", vim.trim(result))
		else
			print("VTSLS binary not found in PATH")
			print("Try installing with: npm install -g @vtsls/language-server")
		end
	end

	local buf = vim.api.nvim_get_current_buf()
	local fname = vim.api.nvim_buf_get_name(buf)
	local util = require("lspconfig.util")
	local root = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
	print("Detected root directory:", root or "none")

	if root then
		local config_files = { "tsconfig.json", "package.json", "jsconfig.json" }
		for _, file in ipairs(config_files) do
			local path = root .. "/" .. file
			local stat = vim.loop.fs_stat(path)
			if stat then
				print("Found:", file)
			end
		end
	end
end, {})
