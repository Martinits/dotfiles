------- NVIM-LASTPLACE -------

require'nvim-lastplace'.setup {
    lastplace_ignore_buftype = {
        "quickfix",
        "nofile",
        "help"
    },
    lastplace_ignore_filetype = {
        "gitcommit",
        "gitrebase",
        "svn",
        "hgcommit",
        "NvimTree",
        "lspsagaoutline"
    },
    lastplace_open_folds = true
}
