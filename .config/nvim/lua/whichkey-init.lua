------- WHICHKEY.NVIM -------

require('which-key').setup{
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
        },
    },
    keys = {
        scroll_down = '<c-j>',
        scroll_up = '<c-k>',
    },
    win = {
        border = "rounded",
    },
    disable = {
        buftypes = { "NvimTree" },
        filetypes = {
            "NvimTree",
            "TelescopePrompt",
            "lspsagaoutline",
            "spectre_panel"
        },
    },
}

vim.cmd.highlight({ "link", "WhichKeyValue", "Info" })

-- custom key mappings hint
local wk = require('which-key')
wk.add({
    { "<LEADER>b", desc = '<buffer>'},
    { "<LEADER>c", desc = '<codeaction> <call-hierachy>'},
    { "<LEADER>d", desc = '<diagnostic> <definition>'},
    { "<LEADER>f", desc = '<telescope>'},
    { "<LEADER>g", desc = '<git>'},
    { "<LEADER>h", desc = '<hop>'},
    { "<LEADER>l", desc = '<lsp-finder>'},
    { "<LEADER>p", desc = '<spectre>'},
    { "<LEADER>r", desc = '<rename-symbol>'},
    { "<LEADER>s", desc = '<swap>'},
    { "<LEADER>t", desc = '<tabular> <table-mode> <todo>'},
    { "<LEADER>m", desc = 'format'},
    { "<LEADER>i", desc = 'inlay-hint'},
})
