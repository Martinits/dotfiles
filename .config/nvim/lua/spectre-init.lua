------- NVIM-SPECTRE -------

vim.keymap.set('n', '<LEADER>pp',  [[<CMD>lua require('spectre').open()<CR>]], { desc = "spectre open" })
vim.keymap.set('n', '<LEADER>pw', [[<CMD>lua require('spectre').open_visual({select_word=true})<CR>]], { desc = "spectre current word" })
vim.keymap.set('v', '<LEADER>pp',  [[<ESC>lua require('spectre').open_visual()<CR>]], { desc = "spectre open" })
vim.keymap.set('n', '<LEADER>pf', [[viw:lua require('spectre').open_file_search()<CR>]], { desc = "spectre current file" })
