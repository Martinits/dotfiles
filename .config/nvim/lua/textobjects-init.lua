------- NVIM-TREESITTER-TEXTOBJECTS -------

require'nvim-treesitter.configs'.setup {
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = { query = "@function.outer", desc = "outer function"},
                ["if"] = { query = "@function.inner", desc = "inner function"},
                ["ac"] = { query = "@class.outer", desc = "outer class" },
                ["ic"] = { query = "@class.inner", desc = "inner class" },
                ["al"] = { query = "@loop.outer", desc = "outer loop" },
                ["il"] = { query = "@loop.inner", desc = "inner loop" },
                ["ap"] = { query = "@parameter.outer", desc = "outer parameter" },
                ["ip"] = { query = "@parameter.inner", desc = "inner parameter" },
                ["is"] = { query = "@statement.outer", desc = "outer statement" },
            },
            selection_modes = {
                ['@function.outer'] = 'V',
                ['@function.inner'] = 'V',
                ['@class.outer'] = 'V',
                ['@class.inner'] = 'V',
                ['@loop.outer'] = 'V',
                ['@loop.inner'] = 'V',
                ['@parameter.outer'] = 'v',
                ['@parameter.inner'] = 'v',
                ['@statement.outer'] = 'V',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>sp"] = { query = "@parameter.inner", desc = "swap next parameter" },
            },
            swap_previous = {
                ["<leader>sP"] = { query = "@parameter.inner", desc = "swap previous parameter" },
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]f"] = { query = "@function.outer", desc = "next function start" },
                ["]c"] = { query = "@class.outer", desc = "next class start" },
            },
            goto_next_end = {
                ["]F"] = { query = "@function.outer", desc = "next function end" },
                ["]C"] = { query = "@class.outer", desc = "next class end" },
            },
            goto_previous_start = {
                ["[f"] = { query = "@function.outer", desc = "previous function start" },
                ["[c"] = { query = "@class.outer", desc = "previous class start" },
            },
            goto_previous_end = {
                ["[F"] = { query = "@function.outer", desc = "previous function end" },
                ["[C"] = { query = "@class.outer", desc = "previous class end" },
            },
        },
        lsp_interop = {
            enable = false,
        }
    }
}
