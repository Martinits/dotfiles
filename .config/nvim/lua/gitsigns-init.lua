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

        map('n', '<LEADER>gn', ':Gitsigns next_hunk<CR>')
        map('n', '<LEADER>gp', ':Gitsigns next_hunk<CR>')
        map({'n', 'v'}, '<LEADER>gs', ':Gitsigns stage_hunk<CR>')
        map({'n', 'v'}, '<LEADER>gr', ':Gitsigns reset_hunk<CR>')
        map('n', '<LEADER>gS', gs.stage_buffer)
        map('n', '<LEADER>gu', gs.undo_stage_hunk)
        map('n', '<LEADER>gR', gs.reset_buffer)
        map('n', '<LEADER>gv', gs.preview_hunk)
        map('n', '<LEADER>gB', function() gs.blame_line{full=true} end)
        map('n', '<LEADER>gb', gs.toggle_current_line_blame)
        map('n', '<LEADER>gd', gs.diffthis)
        map('n', '<LEADER>gD', function() gs.diffthis('HEAD') end)
        map('n', '<LEADER>gt', gs.toggle_deleted)

        map({'o', 'x'}, 'ig', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
