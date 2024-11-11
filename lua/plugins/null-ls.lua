return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },  -- plenuary.nvim — обязательный для null-ls
        -- config = function()
        --     local null_ls = require("null-ls")
        --
        --     null_ls.setup({
        --         sources = {
        --             -- Здесь добавляем нужные вам источники
        --             null_ls.builtins.formatting.prettier,   -- Для форматирования JavaScript, TypeScript, HTML, CSS и др.
        --             null_ls.builtins.formatting.black,      -- Форматирование Python
        --             null_ls.builtins.diagnostics.eslint,    -- Линтер для JavaScript / TypeScript
        --             null_ls.builtins.diagnostics.flake8,    -- Линтер для Python
        --         },
        --     })
        -- end
    }
}

