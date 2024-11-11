return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require('telescope.actions')

    require('telescope').setup {
      defaults = {
        -- Другие настройки
        mappings = {
          i = {
            ["<A-j>"] = actions.move_selection_next,
            ["<A-k>"] = actions.move_selection_previous,
            -- Вставочный режим
            ["<CR>"] = actions.select_default + actions.center, -- Используем стандартное действие с центрированием
          },
          n = {
            -- Нормальный режим
            ["<A-j>"] = actions.move_selection_next,
            ["<A-k>"] = actions.move_selection_previous,
            -- Нормальный режим
            ["<CR>"] = actions.select_default + actions.center, -- Используем стандартное действие с центрированием
          },
        },
      },
    }
  end
}

