------- NVIM-NEOCLIP.LUA -------

require('neoclip').setup{
    enable_persistent_history = true,
    -- default_register = '+',
    keys = {
        telescope = {
            i = {
                select = '<CR>',
                paste = '<C-P>',
                paste_behind = '<C-B>',
                replay = '<C-Q>',
                delete = '<C-D>',
                custom = {},
            },
            n = {
                select = '<CR>',
                paste = 'p',
                paste_behind = 'P',
                replay = 'q',
                delete = 'd',
                custom = {},
            },
        },
    },
}

vim.keymap.set('n', '<LEADER>y', ':Telescope neoclip<CR>')
-- vim.keymap.set('n', '<LEADER>ym', ':Telescope macroscope<CR>')
