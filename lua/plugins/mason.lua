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
                ensure_installed = { "pyright", "gopls", "lua_ls" }, -- Список LSP-серверов для автоматической установки
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

            lspconfig.lua_ls.setup({})
        end,
    },

    -- Настройка mason-null-ls для установки дополнительных инструментов форматирования и линтинга
    {
        "jayp0521/mason-null-ls.nvim",
        dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = { "black", "goimports", "golangci_lint" }, -- Утилиты для автоматической установки
                automatic_installation = true,
            })

            -- Конфигурация null-ls для Python форматирования и линтинга
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black, -- Python: black
                    null_ls.builtins.formatting.goimports, -- Go: goimports
                    null_ls.builtins.diagnostics.golangci_lint, -- Go: golangci_lint
                },
            })
        end,
    },
}

