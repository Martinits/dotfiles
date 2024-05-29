require('hlchunk').setup({
    chunk = {
        enable = true,
        notify = false,
        exclude_filetypes = {
            qf = true,
            asm = true,
            sagafinder = true,
            sagacallhierarchy = true,
            sagaoutline = true,
        },
        support_filetypes = {
            "*.lua",
            "*.js",
            "*.c",
            "*.cpp",
            "*.h",
            "*.rs",
            "*.go",
            "*.py",
            "*.json",
            "*.toml",
            "*.yaml",
        },
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
        },
        style = {
            { fg = "#AB8AA5" },
        },
    },
    indent = {
        enable = true,
        use_treesitter = true,
        chars = { "│", "¦", "┆", "┊"},
        style = {
            { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") }
        },
    },
    line_num = {
        enable = true,
        style = "#AB8AA5",
    },
    blank = {
        enable = false,
    },
})
