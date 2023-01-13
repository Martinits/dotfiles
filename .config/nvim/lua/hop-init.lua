------- HOP.NVIM -------

require'hop'.setup()

vim.keymap.set('n', '<LEADER>hw', '<CMD>HopWord<CR>', { desc = 'hop word' })
vim.keymap.set('n', '<LEADER>hh', '<CMD>HopAnywhere<CR>', { desc = 'hop anywhere' })
