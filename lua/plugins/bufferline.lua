return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup {
    options = {
        numbers = "none", -- можно также использовать "ordinal" или "both"
        close_command = "bdelete! %d", -- команда для закрытия буфера
        right_mouse_command = "bdelete! %d", -- команда для закрытия буфера правой кнопкой мыши
        left_mouse_command = "buffer %d", -- команда для переключения на буфер
        middle_mouse_command = nil, -- команда для действий средней кнопкой мыши
        indicator = {
            style = "underline", -- или "icon"
            icon = "▎", -- символ индикатора
        },
        buffer_close_icon = "", -- иконка закрытия буфера
        modified_icon = "●", -- иконка модифицированного буфера
        close_icon = "", -- иконка закрытия буфера
        left_trunc_marker = "", -- маркер для обрезанных буферов слева
        right_trunc_marker = "", -- маркер для обрезанных буферов справа
        max_name_length = 18, -- максимальная длина имени буфера
        max_prefix_length = 15, -- максимальная длина префикса имени буфера
        tab_size = 18, -- размер табуляции
        diagnostics = false, -- отображение диагностических сообщений
        offsets = {
            {
                filetype = "NvimTree", -- рабочее окно, к которому будет привязан отступ
                text = "File Explorer", -- текст для отступа
                text_align = "left", -- выравнивание текста
                separator = true, -- включить разделитель
            }
        },
        show_buffer_icons = true, -- отображение иконок буферов
        show_buffer_close_icons = true, -- отображение иконок закрытия буферов
        show_close_icon = false, -- отображение иконок закрытия
        show_tab_indicators = true, -- отображение индикаторов вкладок
        persist_buffer_sort = true, -- сохранять порядок буферов между сеансами
        enforce_regular_tabs = false, -- использовать одинаковую ширину вкладок
        always_show_bufferline = true, -- всегда показывать строку буферов
    }
}
 
    end

}
