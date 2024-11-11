return {
    -- Плагины для автодополнения

    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",     -- Источник автодополнения для LSP
        "hrsh7th/cmp-buffer",       -- Источник для слов из текущего буфера
        "hrsh7th/cmp-path",         -- Источник для файловой системы
        "saadparwaiz1/cmp_luasnip", -- Источник для сниппетов
        "L3MON4D3/LuaSnip",         -- Плагин для сниппетов
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- Поддержка сниппетов
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(), -- Открыть меню автодополнения
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Подтвердить выбор
                ["<A-j>"] = cmp.mapping.select_next_item(), -- Навигация по меню
                ["<A-k>"] = cmp.mapping.select_prev_item(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },    -- Автодополнение от LSP
                { name = "luasnip" },     -- Сниппеты
                { name = "buffer" },      -- Слова из буфера
                { name = "path" },        -- Пути к файлам
            }),
        })
    end
}
