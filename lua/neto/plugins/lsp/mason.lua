return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local mason = require("mason")
            local lsp_config = require("mason-lspconfig")

            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })

            lsp_config.setup{
                ensure_installed =
                {
                    -- "lua_ls",
                    -- "rust_analyzer",
                    -- "arduino_language_server",
                    -- "awk_ls",
                    -- "clangd",
                    -- "asm_lsp",
                    -- "cmake",
                    -- "cobol_ls",
                    -- "tailwindcss",
                    -- "ast_grep",
                    -- "dockerls",
                    -- "html",
                    -- "tsserver",
                    -- "spectral",
                    -- "texlab",
                    -- "nil_ls",
                    -- "jedi_language_server",
                    -- "cssls",
                    -- "sqls",
                    -- "svelte",
                    -- "zls"
                },
            }
        end
    }
}
