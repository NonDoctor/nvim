eturn {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        -- Сначала инициализируем Mason
        require("mason").setup()
        -- Настройка Mason для установки LSP
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls" },
        })

        -- Импортируем LSPConfig
        local lspconfig = require("lspconfig")

        -- Настройка LSP для Lua
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT', -- Используйте LuaJIT или Lua 5.1
                        path = vim.split(package.path, ';'),
                    },
                    diagnostics = {
                        globals = { 'vim' }, -- Указываем, что 'vim' является глобальной переменной
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true), -- Добавляем библиотеки в рабочую область
                    },
                    telemetry = {
                        enable = false, -- Отключаем телеметрию
                    },
                },
            },
        }
    end
}
