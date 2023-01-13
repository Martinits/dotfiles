------- TELESCOPE.NVIM -------

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols)
vim.keymap.set('n', '<leader>fS', require('telescope.builtin').lsp_workspace_symbols)
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics)
vim.keymap.set('n', 'gR', require('telescope.builtin').lsp_references)

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
