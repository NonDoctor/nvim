return {
    -- Установка и настройка mason.nvim
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },

    -- mason-lspconfig для интеграции с LSP-серверами
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { 
                    "pyright", "gopls", "dockerls", "jsonls", "lua_ls", "yamlls", "taplo", "marksman",
                    "html","ts_ls", "prettier" -- Добавлено для HTML и TypeScript
                }, -- Список LSP-серверов для автоматической установки
                automatic_installation = true,
            })
        end,
    },

    -- Конфигурация LSP через nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Настройка LSP сервера для Python (pyright)
            lspconfig.pyright.setup({})

            -- Настройка LSP сервера для Go (gopls)
            lspconfig.gopls.setup({})

            -- Настройка LSP для Docker (dockerls)
            lspconfig.dockerls.setup({})

            -- Настройка LSP для JSON (jsonls)
            lspconfig.jsonls.setup({})

            -- Настройка LSP для Lua (lua_ls)
            lspconfig.lua_ls.setup({})

            -- Настройка LSP для YAML (yamlls)
            lspconfig.yamlls.setup({})

            -- Настройка LSP для Taplo (taplo)
            lspconfig.taplo.setup({})

            -- Настройка LSP для Marksman
            lspconfig.marksman.setup({})

            -- Настройка LSP для HTML (html)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
              capabilities.textDocument.completion.completionItem.snippetSupport = true
              
              lspconfig.html.setup {
                capabilities = capabilities,
              }

            -- Настройка LSP для TypeScript и JavaScript (tsserver)
            lspconfig.ts_ls.setup({})
        end,
    },

    -- Настройка mason-null-ls для установки дополнительных инструментов форматирования и линтинга
    {
        "jayp0521/mason-null-ls.nvim",
        dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = { 
                    "black", "goimports", "golangci_lint", "prettier", 
                    "eslint_d",  -- Добавлено для ESLint
                }, -- Утилиты для автоматической установки
                automatic_installation = true,
            })

            -- Конфигурация null-ls для Python форматирования и линтинга
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- Python: black для форматирования
                    null_ls.builtins.formatting.black,
                    
                    -- Go: goimports для форматирования
                    null_ls.builtins.formatting.goimports,
                    
                    -- Go: golangci-lint для диагностики
                    null_ls.builtins.diagnostics.golangci_lint.with({
                        extra_args = { "--fast" },  -- Дополнительные параметры
                    }),

                    -- Prettier: Форматирование кода
                    null_ls.builtins.formatting.prettier,
                    
                    -- ESLint: Линтинг для JavaScript/TypeScript
                    null_ls.builtins.diagnostics.eslint_d.with({
                        extra_args = { "--fix" },  -- Можно добавить дополнительные параметры
                    }),
                },
            })
        end,
    },
}

