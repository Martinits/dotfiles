------- BUFFERLINE.NVIM -------

vim.opt.termguicolors = true
vim.o.mousemoveevent = true
require('bufferline').setup {
    options = {
        mode = "buffers",
        numbers = function(opts)
            local tmpid = opts.ordinal > 9 and 10 or opts.ordinal
            local icons = {"", "", "", "", "", "", "", "", "", ""}
            return icons[tmpid]
        end,
        indicator = {
            style = 'underline'
        },
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return level == "error" and ("  " .. count)
                    or (level == "warning" and "  " or "")
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "Files",
                text_align = "center",
                separator = true
            }
        },
        show_close_icon = false,
        separator_style = "slant",
        hover = {
            enabled = true,
            delay = 100,
            reveal = {'close'}
        },
        sort_by = 'id',
        groups = {
            items = {
                require('bufferline.groups').builtin.pinned:with({ icon = "📌" })
            }
        }

    },
    highlights = {
        modified = {
            fg = '#F36E7A',
        },
        modified_visible = {
            fg = '#F36E7A',
        },
        modified_selected = {
            fg = '#F36E7A',
        }
    }
}

vim.keymap.set('n', '<LEADER>bg', '<CMD>BufferLinePick<CR>', {silent = true})
vim.keymap.set('n', '<LEADER>bc', '<CMD>BufferLinePickClose<CR>', {silent = true})
vim.keymap.set('n', '<LEADER>bp', '<CMD>BufferLineTogglePin<CR>', {silent = true})
vim.keymap.set('n', '<LEADER>1', '<cmd>lua require("bufferline").go_to_buffer(1, true)<cr>', {silent = true})
vim.keymap.set('n', '<LEADER>2', '<cmd>lua require("bufferline").go_to_buffer(2, true)<cr>', {silent = true})
vim.keymap.set('n', '<LEADER>3', '<cmd>lua require("bufferline").go_to_buffer(3, true)<cr>', {silent = true})
vim.keymap.set('n', '<LEADER>4', '<cmd>lua require("bufferline").go_to_buffer(4, true)<cr>', {silent = true})
vim.keymap.set('n', '<LEADER>5', '<cmd>lua require("bufferline").go_to_buffer(5, true)<cr>', {silent = true})
vim.keymap.set('n', '<LEADER>6', '<cmd>lua require("bufferline").go_to_buffer(6, true)<cr>', {silent = true})
vim.keymap.set('n', '<LEADER>7', '<cmd>lua require("bufferline").go_to_buffer(7, true)<cr>', {silent = true})
vim.keymap.set('n', '<LEADER>8', '<cmd>lua require("bufferline").go_to_buffer(8, true)<cr>', {silent = true})
vim.keymap.set('n', '<LEADER>9', '<cmd>lua require("bufferline").go_to_buffer(9, true)<cr>', {silent = true})
