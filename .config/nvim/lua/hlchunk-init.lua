require('hlchunk').setup({
    chunk = {
        exclude_filetypes = {
            qf = true,
            asm = true
        },
        support_filetypes = {
            "*.lua",
            "*.js",
            "*.c",
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
        use_treesitter = false,
        chars = { "│", "¦", "┆", "┊"},
        style = {
            { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") }
        },
    },
    line_num = {
        style = "#AB8AA5",
    },
    blank = {
        enable = false,
    },
})
