------- RNVIMR -------

vim.keymap.set('t', '<M-i>', [[<C-\><C-n>:RnvimrResize<CR>]], {silent = true})
vim.keymap.set('n', '<M-o>', [[:RnvimrToggle<CR>]], {silent = true})
vim.keymap.set('t', '<M-o>', [[<C-\><C-n>:RnvimrToggle<CR>]], {silent = true})
-- Make Ranger replace Netrw and be the file explorer
vim.g.rnvimr_enable_ex = 1
-- Make Ranger to be hidden after picking a file
vim.g.rnvimr_enable_picker = 1
vim.cmd.highlight({'link', 'RnvimrNormal', 'CursorLine'})
vim.g.rnvimr_action = {
    ['<C-t>'] = 'NvimEdit tabedit',
    ['<C-x>'] = 'NvimEdit split',
    ['<C-v>'] = 'NvimEdit vsplit',
    gw        = 'JumpNvimCwd',
    yw        = 'EmitRangerCwd'
}
-- change ranger colorscheme for alacritty
vim.g.rnvimr_ranger_cmd = {'ranger', '--cmd=set colorscheme jungle'}
