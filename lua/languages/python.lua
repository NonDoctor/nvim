return {
     {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Настройка для Python (pyright)
            lspconfig.pyright.setup({})
        end,
    },

    -- mason-null-ls для установки дополнительных утилит, таких как goimports и golines
    {
        "jayp0521/mason-null-ls.nvim",
        dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = { "black" }, -- Автоматическая установка утилит
                automatic_installation = true,
            })

            -- Настройка null-ls для форматирования и линтинга
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                },
            })
        end,
    },
}
