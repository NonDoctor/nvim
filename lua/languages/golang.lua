return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",  -- Плагин для интеграции с внешними форматтерами и линтерами
        "jay-babu/mason-null-ls.nvim",      -- Интеграция между Mason и null-ls для установки внешних утилит
    },
    config = function()
        -- Сначала инициализируем Mason
        require("mason").setup()

        -- Настройка Mason для установки LSP и других инструментов
        require("mason-lspconfig").setup({
            ensure_installed = { "gopsl" },  -- Убедитесь, что Pyright установлен
        })

        -- Импортируем LSPConfig
        local lspconfig = require("lspconfig")

        -- Настройка LSP для Go с gopls
        lspconfig.gopls.setup({
            cmd = { "gopls" },
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,  -- Анализ неиспользуемых параметров
                        shadow = true,        -- Анализ затмения переменных
                    },
                    staticcheck = true,  -- Статическая проверка
                },
            },
        })
    end
}

