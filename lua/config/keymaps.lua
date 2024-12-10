local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('', '<A-q>', '<Esc>', opts) -- ESCATE
map('n', '<C-s>', ':w<CR>', opts) -- Сохранение файла по Ctrl+s
map('n', '<C-q>', ':q<CR>', opts) -- Выход из файла по Ctrl+q

-- Переместиться к первому символу строки (Shift + H)
map('n', '<S-h>', '^', opts)
-- Переместиться к последнему символу строки (Shift + L)
map('n', '<S-l>', 'g_', opts)-- Настройка горячих клавиш в визуальном режиме

-- Открытие/фокусировка neo-tree
map('n', '<A-e>', ':Neotree toggle<CR>', opts)  -- Открыть или закрыть neo-tree

-- Функция для сдвига строк влево
map('v', '<C-A-l>', ':\'<,\'>normal! >><CR> V\'<,\'>', opts)
-- Функция для сдвига строк вправо
map('v', '<C-A-h>', ':\'<,\'>normal! <<<CR> V\'<,\'>', opts)
-- Функция для сдвига строк вверх
map('v', '<C-A-k>', ':\'<,\'>move -2<CR>gv', opts)
-- Функция для сдвига строк вниз
map('v', '<C-A-j>', ":move '>+1<CR>gv=gv", opts)

-- Сдвинуть строку влево
map('n', '<C-A-h>', '<<', opts)
-- Перемещение строки вниз
map('n', '<C-A-j>', ':m .+1<CR>==', opts)
-- Перемещение строки вверх
map('n', '<C-A-k>', ':m .-2<CR>==', opts)

-- Переход между окнами по Ctrl+h/j/k/l
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- bufferline
map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)

-- Закрыть буфер и перейти на предыдущее окно
map('n', '<A-c>', ':wincmd p | bdelete<CR>', opts)


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<A-b>', builtin.find_files, opts)
vim.keymap.set('n', '<A-f>', require('telescope.builtin').live_grep, opts)

-- Перемещение на 20 строк вниз с помощью Shift+jk
map('n', '<S-j>', '10j', opts)
-- Перемещение на 20 строк вверх с помощью Shift+kj
map('n', '<S-k>', '10k', opts)

-- Перейти к определению
map('n', '<A-g>', ':lua vim.lsp.buf.definition()<CR>', opts)
-- Вернуться назад
map('n', '<leader>gD', ':lua vim.lsp.buf.references()<CR>', opts)

-- Функция для поиска текущего слова
function search_current_word()
  -- Проверяем, есть ли активное выделение (подсвеченный текст поиска)
  if vim.v.hlsearch == 1 then
    vim.cmd('nohlsearch')  -- Отключаем подсветку поиска
  else
    -- Если подсветки нет, ищем текущее слово
    local word = vim.fn.expand('<cword>')  -- Получить текущее слово под курсором
    vim.cmd('execute "normal! /' .. word .. '\\<CR>"')  -- Выполнить поиск
  end
end
-- Привязка для поиска текущего слова с помощью Alt+v
map('n', '<A-v>', ':lua search_current_word()<CR>', opts)
-- Установить новую комбинацию клавиш для 'n'
map('n', '<A-j>', 'n', opts) 
-- Установить новую комбинацию клавиш для 'p'
map('n', '<A-k>', 'N', opts)

-- Переназначение отмены изменений
map('n', '<A-h>', 'u', opts)
-- Переназначение повторения отмененных изменений
map('n', '<A-l>', '<C-r>', opts)

-- Выделить вниз на 10 строк (Alt + j)
map('v', '<S-j>', '10j',  opts)
-- Выделить вверх на 10 строк (Alt + k)
map('v', '<S-k>', '10k',  opts)
-- Выделить до начала или конца
map('v', '<S-h>', '^',  opts)
map('v', '<S-l>', 'g_',  opts)

-- Вставляем внизу пустую строку
map('n', '<CR>', 'o<Esc>', opts)

-- Удаляем до конца или начала строки
map('o', 'H', '^', opts)
map('o', 'L', 'g_', opts)

-- Не помню но надо
map('n', '<A-d>', '<C-o>', opts)

-- Глобальная функция для замены текста в нормальном режиме
_G.replace_selected_or_prompt = function()
    -- Запрашиваем шаблон поиска
    local search_pattern = vim.fn.input("Что меняем: ")
    if search_pattern == "" then
        print("Шаблон поиска не может быть пустым!")
        return
    end

    -- Запрашиваем текст для замены
    local replacement = vim.fn.input("На что заменить: ")

    -- Выполняем замену
    local command = string.format("%%s/%s/%s/g", vim.fn.escape(search_pattern, "/\\."), vim.fn.escape(replacement, "/\\"))
    vim.cmd(command)

    -- Переход в нормальный режим после выполнения замены
    vim.cmd("normal! n")
end

-- Привязываем Shift+R к функции в нормальном режиме
map( "n", "R", "<cmd>lua replace_selected_or_prompt()<CR>", opts)
-- Горячие клавиши для создания окон (сплитов)
map('n', '<C-w><C-h>', ':vsplit<CR>', opts)  -- Вертикальный сплит (слева)
map('n', '<C-w><C-j>', ':split<CR>', opts)    -- Горизонтальный сплит (снизу)
map('n', '<C-w><C-k>', ':split<CR>', opts)    -- Горизонтальный сплит (сверху)
map('n', '<C-w><C-l>', ':vsplit<CR>', opts)  -- Вертикальный сплит (справа)

-- Горячие клавиши для изменения размера окна с помощью Ctrl + стрелки
map('n', '<C-Down>', ':resize +2<CR>', opts)  -- Увеличить высоту окна вниз
map('n', '<C-Up>', ':resize -2<CR>', opts)   -- Уменьшить высоту окна вверх
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)  -- Уменьшить ширину окна влево
map('n', '<C-Right>', ':vertical resize +2<CR>', opts) -- Увеличить ширину окна вправо

-- Настройка для удаления
map('n', 'd', '"_d', opts)
map('n', 'dd', '"_dd', opts)
map('v', 'd', '"_d', opts)
