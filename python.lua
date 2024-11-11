return {
    -- Установка и настройка mason-lspconfig для управления LSP серверами
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright" }, -- Список LSP-серверов для автоматической установки
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
        end,
    },

    -- Настройка mason-null-ls для установки дополнительных инструментов форматирования и линтинга
    {
        "jayp0521/mason-null-ls.nvim",
        dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = { "black" }, -- Утилиты для автоматической установки
                automatic_installation = true,
            })

            -- Конфигурация null-ls для Python форматирования и линтинга
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                },
            })
        end,
    },
}

