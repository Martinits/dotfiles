------- FIDGET.NVIM -------

require"fidget".setup{
    text = {
        spinner = "dots",
        done = "🗸",
    },
}

-- FidgetTask is gray_6
vim.cmd.highlight({'FidgetTask', 'guifg=#5E6C70'})
