return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
            init = function()
                require("lazyvim.util").lsp.on_attach(function(client, buffer)
                    if client.name ~= "ts_ls" and client.name ~= "vtsls" then
                        return
                    end
                    local map = function(lhs, rhs, desc)
                        vim.keymap.set("n", lhs, rhs, { buffer = buffer, silent = true, desc = desc })
                    end
                    map("<leader>co", function()
                        if vim.fn.exists(":TypescriptOrganizeImports") > 0 then
                            vim.cmd("TypescriptOrganizeImports")
                        else
                            vim.lsp.buf.code_action({
                                context = { only = { "source.organizeImports.ts", "source.organizeImports" } },
                                apply = true,
                            })
                        end
                    end, "Organize Imports")
                    map("<leader>cR", function()
                        if vim.fn.exists(":TypescriptRenameFile") > 0 then
                            vim.cmd("TypescriptRenameFile")
                            return
                        end
                        local old = vim.api.nvim_buf_get_name(buffer)
                        local new = vim.fn.input("New path: ", old, "file")
                        if new ~= "" and new ~= old then
                            vim.fn.mkdir(vim.fn.fnamemodify(new, ":h"), "p")
                            os.rename(old, new)
                            vim.api.nvim_buf_set_name(buffer, new)
                            vim.cmd.edit(vim.fn.fnameescape(new))
                        end
                    end, "Rename File")
                end)
            end,
        },
        opts = (function()
            local util = require("lspconfig.util")
            local base = vim.lsp.protocol.make_client_capabilities()
            local ok_blink, blink = pcall(require, "blink.cmp")
            local capabilities = ok_blink and blink.get_lsp_capabilities and blink.get_lsp_capabilities(base) or base

            local eslint_root = util.root_pattern(
                "eslint.config.js",
                "eslint.config.mjs",
                "eslint.config.cjs",
                ".eslintrc.js",
                ".eslintrc.cjs",
                ".eslintrc.json",
                ".eslintrc",
                "package.json",
                ".git"
            )

            return {
                capabilities = capabilities,
                servers = {
                    vtsls = {
                        settings = {
                            vtsls = { autoUseWorkspaceTsdk = true },
                            typescript = { format = { enable = false } },
                            javascript = { format = { enable = false } },
                        },
                    },
                    eslint = {
                        root_dir = function(fname)
                            return eslint_root(fname)
                        end,
                        settings = {
                            workingDirectories = { mode = "location" },
                            experimental = { useFlatConfig = false },
                        },
                        on_attach = function(client, _)
                            client.server_capabilities.documentFormattingProvider = false
                        end,
                    },
                    lua_ls = {
                        settings = {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                diagnostics = { globals = { "vim" } },
                                workspace = { checkThirdParty = false },
                                telemetry = { enable = false },
                            },
                        },
                    },
                    pyright = { settings = { python = { pythonPath = vim.fn.exepath("python") } } },
                    gopls = {
                        settings = {
                            gopls = {
                                analyses = { unusedparams = true },
                                staticcheck = true,
                                usePlaceholders = true,
                                completeUnimported = true,
                            },
                        },
                    },
                    clangd = {
                        cmd = {
                            "clangd",
                            "--offset-encoding=utf-16",
                            "-j=4",
                            "--background-index",
                            "--clang-tidy",
                            "--completion-style=detailed",
                        },
                    },
                    html = {},
                },
                setup = {
                    ts_ls = function(_, sopts)
                        local merged = vim.tbl_deep_extend("force", { capabilities = capabilities }, sopts or {})
                        require("typescript").setup({ server = merged })
                        return true
                    end,
                },
            }
        end)(),
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "ts_ls",
                "vtsls",
                "eslint",
                "lua_ls",
                "pyright",
                "gopls",
                "clangd",
                "html",
            },
        },
    },
}
