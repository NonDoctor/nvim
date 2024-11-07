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
            ensure_installed = { "pyright" },  -- Убедитесь, что Pyright установлен
        })

        -- Настройка Mason для установки black через mason-null-ls
        require("mason-null-ls").setup({
            ensure_installed = { "black" },  -- Устанавливаем black через Mason
        })

        -- Импортируем LSPConfig
        local lspconfig = require("lspconfig")

        -- Настройка LSP для Python с Pyright
        lspconfig.pyright.setup {
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "basic",  -- Режим проверки типов: "off", "basic", "strict"
                    },
                },
            },
        }

        -- Настройка null-ls для форматирования с помощью black
        local null_ls = require("null-ls")

        -- Добавляем форматтер black
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.black.with({
                    extra_args = { "--line-length", "88" },  -- Дополнительные аргументы для black
                }),
            },
            -- Включаем автозапуск null-ls
            on_attach = function(client, bufnr)
                if client.name == "null-ls" then
                    -- Используем новую функцию для форматирования
                    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = false})")
                end
            end
        })
    end
}

