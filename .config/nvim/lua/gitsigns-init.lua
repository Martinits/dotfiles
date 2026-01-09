------- GITSIGNS.NVIM -------

require('gitsigns').setup {
    signs = {
        add          = { text = '┃', },
        change       = { text = '┃', },
        delete       = { text = '┃', },
        topdelete    = { text = '┃', },
        changedelete = { text = '┃', },
        untracked    = { text = '┃', },
    },
    sign_priority = 9,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<LEADER>gn', ':Gitsigns next_hunk<CR>', {desc = 'next hunk'})
        map('n', '<LEADER>gp', ':Gitsigns prev_hunk<CR>', {desc = 'previous hunk'})
        map({'n', 'v'}, '<LEADER>gs', ':Gitsigns stage_hunk<CR>', {desc = 'stage hunk'})
        map({'n', 'v'}, '<LEADER>gr', ':Gitsigns reset_hunk<CR>', {desc = 'reset hunk'})
        map('n', '<LEADER>gS', gs.stage_buffer, {desc = 'stage current buffer'})
        map('n', '<LEADER>gu', gs.undo_stage_hunk, {desc = 'undo stage hunk'})
        map('n', '<LEADER>gR', gs.reset_buffer, {desc = 'reset current buffer'})
        map('n', '<LEADER>gv', gs.preview_hunk, {desc = 'preview hunk diff'})
        map('n', '<LEADER>gB', function() gs.blame_line{full=true} end, {desc = 'blame line'})
        map('n', '<LEADER>gb', gs.toggle_current_line_blame, {desc = 'toggle line blame'})
        map('n', '<LEADER>gd', gs.diffthis, {desc = 'diff this to index'})
        map('n', '<LEADER>gD', function() gs.diffthis('HEAD') end, {desc = 'diff this to HEAD'})
        map('n', '<LEADER>gt', gs.toggle_deleted, {desc = 'toggle show deleted'})

        map({'o', 'x'}, 'ig', ':<C-U>Gitsigns select_hunk<CR>', {desc = 'hunk object'})
    end
}

require("scrollbar.handlers.gitsigns").setup()
