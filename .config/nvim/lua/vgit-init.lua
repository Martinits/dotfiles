------- VGIT.NVIM ------

require('vgit').setup({
    settings = {
        live_blame = {
            enabled = false,
        },
        signs = {
            priority = 9,
        },
    }
})
vim.keymap.set('n', '<LEADER>gp', ':VGit hunk_up<CR>')
vim.keymap.set('n', '<LEADER>gn', ':VGit hunk_down<CR>')
