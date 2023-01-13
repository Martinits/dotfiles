------- WHICHKEY.NVIM -------


require('which-key').setup{
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
        },
    },
    popup_mappings = {
        scroll_down = '<c-j>',
        scroll_up = '<c-k>',
    },
    window = {
        border = "rounded",
    },
    disable = {
        buftypes = { "NvimTree" },
        filetypes = { "NvimTree", "TelescopePrompt", "lspsagaoutline" },
    },
}

vim.cmd.highlight({ "link", "WhichKeyValue", "Info" })
