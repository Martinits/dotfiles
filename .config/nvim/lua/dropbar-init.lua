------- DROPBAR.NVIM -------

require('dropbar').setup{
    general = {
        enable = false
    },
    icons = {
        ui = {
            bar = {
                separator = '  '
            },
            menu = {
                indicator = '󰜴'
            }
        }
    }
}

vim.keymap.set('n', '<LEADER>bp', function() require('dropbar.api').pick() end,
               { desc = 'dropbar pick mode' })

vim.cmd.highlight({"link", "DropBarIconUISeparator", "Operator", bang = true})
vim.cmd.highlight({"link", "DropBarIconUIIndicator", "Operator", bang = true})
