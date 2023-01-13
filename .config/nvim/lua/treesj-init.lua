------- TREESJ -------

require('treesj').setup{
    use_default_keymaps = false,
    max_join_length = 1000
}

vim.keymap.set('n', 'gT', ':TSJToggle<CR>', { desc = "treesj: toggle" })
vim.keymap.set('n', 'gS', ':TSJSplit<CR>', { desc = "treesj: split" })
vim.keymap.set('n', 'gJ', ':TSJJoin<CR>', { desc = "treesj: join" })
