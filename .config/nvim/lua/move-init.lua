------- MOVE.NVIM -------

vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>',    {silent = true})
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>',   {silent = true})
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>',   {silent = true})
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>',  {silent = true})
vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>',   {silent = true})
vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>',  {silent = true})
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>',  {silent = true})
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', {silent = true})
