------- TELESCOPE.NVIM -------

vim.keymap.set('n', '<LEADER>ff', require('telescope.builtin').find_files, { desc = 'telescope: find files' })
vim.keymap.set('n', '<LEADER>fg', require('telescope.builtin').live_grep, { desc = 'telescope: live grep' })
vim.keymap.set('n', '<LEADER>fb', require('telescope.builtin').buffers, { desc = 'telescope: find buffer' })
vim.keymap.set('n', '<LEADER>fh', require('telescope.builtin').help_tags, { desc = 'telescope: help tags' })
vim.keymap.set('n', '<LEADER>fw',
    -- function() require('telescope.builtin').grep_string { word_match = '-w' } end,
    function()
      require("telescope.builtin").live_grep({
        default_text = "\\b"..vim.fn.expand("<cword>").."\\b",
      })
    end,
    { desc = 'telescope: search cursor string' }
)
vim.keymap.set('n', '<LEADER>fs', require('telescope.builtin').lsp_document_symbols, { desc = 'telescope: lsp buffer symbols' })
vim.keymap.set('n', '<LEADER>fS', require('telescope.builtin').lsp_workspace_symbols, { desc = 'telescope: lsp workspace symbols' })
vim.keymap.set('n', '<LEADER>fd', require('telescope.builtin').diagnostics, { desc = 'telescope: diagnostics' })
vim.keymap.set('n', 'gR', require('telescope.builtin').lsp_references, { desc = 'telescope: lsp references' })

require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            },
            n = {
                ["<C-c>"] = "close",
            },
        },
        layout_config = {
            horizontal = {
                width = 0.95,
                height = 0.95,
                preview_width = 0.6
            }
        },
    },
    extensions = {}
}

-- plugs
require('telescope').load_extension('fzf')
-- require("telescope").load_extension("ui-select")
require('telescope').load_extension('neoclip')
require('telescope').load_extension('macroscope')
