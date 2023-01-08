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
vim.keymap.set('n', '<LEADER>hp', ':VGit hunk_up<CR>')
vim.keymap.set('n', '<LEADER>hn', ':VGit hunk_down<CR>')
