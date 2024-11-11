return {
    'mnjm/bottomline.nvim',
    dependencies = {  
        'lewis6991/gitsigns.nvim', 
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        require('bottomline').setup({
            enable = true,
            enable_icons = false,
            seperators = { '', '' },              -- seperators icons
            enable_git = true,                    -- enable git section
            enable_lsp = true,                    -- enable lsp section
            display_buf_no = false,               -- add additional buf number section at the end of statusline
            git_symbols = {
                branch = "",
                added = "+",
                removed = "-",
                changed = "~",
            },
            lsp_symbols = {
                error = "E:",
                warn = "W:",
                info = "I:",
                hint = "H:",
            },
            -- bottomline highlights
            highlights = {
                -- Active Statusline
                BLMode          = {fg = "#000000", bg = "#5faf5f", bold = true},
                BLGitInfo       = {fg = "#000000", bg="#5f8787", bold = false},
                BLFill          = {fg = "#ffffff", bg="#282828", bold = false},
                BLFile          = {link = 'BLMode'},
                BLLspInfo       = {link = 'BLGitInfo'},
                BLFileType      = {fg = "#ffffff", bg = "#878787", bold = false},
                BLLine          = {fg = "#ffffff", bg="#585858", bold = false},
                BLBuf           = {link = 'BLMode'},
                -- Inactive statusline
                BLFileInactive  = {link = 'BLFileType'},
                BLBufInactive   = {link = 'BLFileInactive'},
            },
        })
    end
}
