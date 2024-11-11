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
                    "pyright", "gopls", "dockerls", "jsonls", "lua_ls", "yamlls", "taplo", "marksman" 
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
                }, -- Утилиты для автоматической установки
                automatic_installation = true,
            })

            -- Конфигурация null-ls для Python форматирования и линтинга
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- Python: black for formatting
                    null_ls.builtins.formatting.black,
                    
                    -- Go: goimports for formatting
                    null_ls.builtins.formatting.goimports,
                    
                    -- Go: golangci-lint for diagnostics
                    null_ls.builtins.diagnostics.golangci_lint.with({
                        extra_args = { "--fast" },  -- You can pass additional args if needed
                    }),

                    -- Prettier: Code formatter
                    null_ls.builtins.formatting.prettier,
                },
            })
        end,
    },
}

