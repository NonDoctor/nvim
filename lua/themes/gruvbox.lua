return {
  "ellisonleao/gruvbox.nvim",
  config = function()
    -- Устанавливаем тему
    vim.cmd("colorscheme gruvbox")
    
    -- Устанавливаем фон на темный
    -- vim.cmd("set background=dark")  -- или "light", если хотите светлый фон
    --
    -- -- Убираем фон для различных элементов
    -- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")  -- Убираем фон для обычного текста
    -- vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE")  -- Прозрачность для строки состояния
    -- vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")  -- Прозрачность для номеров строк
    -- vim.cmd("hi VertSplit guibg=NONE ctermbg=NONE")  -- Прозрачность для вертикальных разделителей
  end
}

