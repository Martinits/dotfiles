------- LUALINE.NVIM -------

require('lualine').setup {
    options = {
        theme = 'everforest', -- onedark material everforest
        refresh = {
            statusline = 500,
            tabline = 500,
            winbar = 500,
        }
    },
    sections = {
        lualine_b = {
            {
                'branch',
                icon = ''
            },
            {
                'diff',
                symbols = {added = '', modified = '', removed = ''}
            }
        },
        lualine_c = {
            'filename',
            function()
                return require("lsp_signature").status_line(60).label
            end
        },
        lualine_x = {
            {
                'diagnostics',
                symbols = {error = '', warn = '', info = '', hint = ''},
                always_visible = true,
                diagnostics_color = {
                    error = { fg = '#FF4848' },
                    warn  = { fg = '#FF9F43' },
                    info  = { fg = '#57C7FF' },
                    hint  = { fg = '#5AF78E' },
                },
            },
            'filetype',
            'encoding'
        },
        lualine_z = {
            function() return vim.api.nvim_buf_line_count(0) end,
            'location'
        }
    },
    extensions = {}
}
