------- TOGGLETERM.NVIM -------

require("toggleterm").setup{
    open_mapping = [[<C-\>]],
    direction = 'float',
    float_opts = {
        border = 'curved',
    }
}

vim.api.nvim_create_autocmd('TermOpen',
    {
        pattern = 'term://*',
        command = 'startinsert'
    }
)
