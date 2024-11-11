-- Общие настройки Neovim
vim.o.clipboard = 'unnamedplus'       -- Буффер обмена
vim.o.textwidth = 80                  -- Макс ширина текста
vim.o.wrap =  false                    -- Включаем визуальный перенос строк
vim.o.number = true                   -- Включить нумерацию строк
vim.o.relativenumber = true
vim.o.shiftwidth = 4                  -- Размер отступа при использовании табуляции
vim.o.expandtab = true                -- Преобразование табуляции в пробелы
vim.o.smartindent = true              -- Умная автоиндентация
vim.o.swapfile = false                -- Отключить swap-файл
vim.o.backup = false                  -- Отключить создание бэкапов
vim.o.hlsearch = true                 -- Подсветка результатов поиска
vim.o.ignorecase = true               -- Игнорировать регистр при поиске
vim.o.smartcase = true                -- Умный поиск (с учетом регистра, если введено с заглавной буквы)

-- Настройки для улучшения производительности
vim.o.updatetime = 300                -- Время обновления в мс
vim.o.timeoutlen = 500                -- Время ожидания для маппингов
vim.o.termguicolors = true            -- Включить поддержку 24-битных цветов

-- Установите видимость 5 строк при перемещении вверх или вниз
vim.o.scrolloff = 5
vim.o.sidescrolloff = 15  -- Устанавливаем количество символов для горизонтальной прокрутки

-- Настроим подсветку номера строки курсора
vim.o.cursorline = true  -- Включаем подсветку текущей строки
vim.cmd("highlight CursorLineNr guifg=#ffcc00")  -- Устанавливаем желтый цвет для номера строки

-- Автоформатирование Python-файлов при сохранении
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
})
