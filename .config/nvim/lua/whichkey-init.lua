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
wk.register({
    b = { name = '<buffer>' },
    c = { name = '<codeaction> <call-hierachy>' },
    d = { name = '<diagnostic> <definition>' },
    f = { name = '<telescope>' },
    g = { name = '<git>' },
    h = { name = '<hop>' },
    l = { name = '<lsp-finder>' },
    p = { name = '<spectre>' },
    r = { name = '<rename-symbol>' },
    s = { name = '<swap>' },
    t = { name = '<tabular> <table-mode> <todo>' },
    m = { name = 'format' },
    i = { name = 'inlay-hint' },
}, { prefix = '<LEADER>' })
