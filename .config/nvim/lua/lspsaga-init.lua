------- LSPSAGA.NVIM -------

require('lspsaga').setup{
    diagnostic = {
        show_code_action = false,
    },
    finder = {
        default = 'def+ref+imp',
    },
    lightbulb = {
        virtual_text = false,
    },
    outline = {
        win_width = 40,
        keys = {
            jump = "<CR>",
        },
    },
    symbol_in_winbar = {
        separator = '  ',
    },
    scroll_preview = {
        scroll_down = '<C-j>',
        scroll_up = '<C-k>',
    },
}

vim.keymap.set("n", "<LEADER>lf", "<CMD>Lspsaga finder<CR>", { desc = "lspsaga: lsp finder" }) -- use <C-t> to jump back
vim.keymap.set({"n","v"}, "<LEADER>ca", "<cmd>Lspsaga code_action<CR>", { desc = "lspsaga: code action" })
vim.keymap.set("n", "<LEADER>rn", "<CMD>Lspsaga rename<CR>", { desc = "lspsaga: rename symbol" })
vim.keymap.set("n", "<LEADER>dl", "<CMD>Lspsaga show_line_diagnostics<CR>", { desc = "lspsaga: show line diagnostic" })
vim.keymap.set("n", "<LEADER>dc", "<CMD>Lspsaga show_cursor_diagnostics<CR>", { desc = "lspsaga: show cursor diagnostic" })
vim.keymap.set("n", "<LEADER>db", "<CMD>Lspsaga show_buf_diagnostics<CR>", { desc = "lspsaga: show buffer diagnostic" })
vim.keymap.set("n", "<LEADER>dk", "<CMD>Lspsaga peek_definition<CR>", { desc = "lspsaga: peek definition" })
vim.keymap.set("n", "<LEADER>-", "<CMD>Lspsaga diagnostic_jump_prev<CR>", { desc = "lspsaga: goto prev diagnostic" })
vim.keymap.set("n", "<LEADER>=", "<CMD>Lspsaga diagnostic_jump_next<CR>", { desc = "lspsaga: goto next diagnostic" })
vim.keymap.set("n", "<LEADER>[", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true, desc = "lspsaga: goto prev error" })
vim.keymap.set("n", "<LEADER>]", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true, desc = "lspsaga: goto next error" })
vim.keymap.set("n","<LEADER>o", "<CMD>Lspsaga outline<CR>", { desc = "lspsaga: outline" })
vim.keymap.set("n", "<LEADER>ci", "<CMD>Lspsaga incoming_calls<CR>", { desc = "lspsaga: call hierachy incoming" })
vim.keymap.set("n", "<LEADER>co", "<CMD>Lspsaga outgoing_calls<CR>", { desc = "lspsaga: call hierachy outcoming" })
