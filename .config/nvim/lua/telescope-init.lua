------- NVIM-TELESCOPE -------

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            },
            n = {
                ["<C-c>"] = "close",
            },
        },
    },
}
-- plugs
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('fzf_native')
require'telescope'.load_extension('zoxide')
