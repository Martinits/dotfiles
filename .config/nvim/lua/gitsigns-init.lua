------- GITSIGNS.NVIM -------

require('gitsigns').setup {
    signs = {
        add          = { hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
        change       = { hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = '┃', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = '┃', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        untracked    = { hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    },
    sign_priority = 9,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<LEADER>hn', ':Gitsigns next_hunk<CR>')
        map('n', '<LEADER>hp', ':Gitsigns next_hunk<CR>')
        map({'n', 'v'}, '<LEADER>hs', ':Gitsigns stage_hunk<CR>')
        map({'n', 'v'}, '<LEADER>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<LEADER>hS', gs.stage_buffer)
        map('n', '<LEADER>hu', gs.undo_stage_hunk)
        map('n', '<LEADER>hR', gs.reset_buffer)
        map('n', '<LEADER>hv', gs.preview_hunk)
        map('n', '<LEADER>hB', function() gs.blame_line{full=true} end)
        map('n', '<LEADER>hb', gs.toggle_current_line_blame)
        map('n', '<LEADER>hd', gs.diffthis)
        map('n', '<LEADER>hD', function() gs.diffthis('HEAD') end)
        map('n', '<LEADER>ht', gs.toggle_deleted)

        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
