------- LSPSAGA.NVIM -------

require('lspsaga').setup{
    scroll_preview = {
        scroll_down = '<C-j>',
        scroll_up = '<C-k>',
    },
    lightbulb = {
        -- sign_priority = 40,
        virtual_text = false,
    },
    finder = {
        keys = {
            jump_to = 'o',
            edit = '<CR>',
        },
    },
    diagnostic = {
        show_code_action = false,
        custom_msg = nil,
    },
    outline = {
        win_width = 40,
        keys = {
            jump = "<CR>",
        },
    },
    symbol_in_winbar = {
        separator = '  ',
        respect_root = true,
    },
    callhierarchy = {
        show_detail = true,
        keys = {
            jump = "<CR>",
            quit = "<ESC>",
        },
    },
    ui = {
        incoming = " ",
        outgoing = " ",
    },

    -- old config for commit db0c141
    -- move_in_saga = { prev = '<C-k>', next = '<C-j>'},
    -- diagnostic_header = { " ", " ", " ", " " },
    -- code_action_lightbulb = {
    --     -- sign_priority = 20,
    --     virtual_text = false,
    -- },
    -- finder_icons = {
    --     def = '🔑 ',
    --     ref = '🧲 ',
    --     link = '🔗 ',
    -- },
    -- finder_action_keys = {
    --     open = {'o', '<CR>'},
    --     vsplit = 's',
    --     split = 'i',
    --     tabe = 't',
    --     quit = {'q', '<ESC>'},
    -- },
    -- definition_action_keys = {
    --     edit = '<C-c>o',
    --     vsplit = '<C-c>v',
    --     split = '<C-c>i',
    --     tabe = '<C-c>t',
    --     quit = 'q',
    -- },
    -- rename_action_quit = '<ESC>',
    -- symbol_in_winbar = {
    --     enable = true,
    --     separator = '  ',
    --     file_formatter = "%:.",
    --     click_support = function(node, clicks, button, modifiers)
    --             -- To see all available details: vim.pretty_print(node)
    --             local st = node.range.start
    --             local en = node.range['end']
    --             if button == "l" then
    --                 if clicks == 2 then
    --                     -- double left click to do nothing
    --                 else -- jump to node's starting line+char
    --                     vim.fn.cursor(st.line + 1, st.character + 1)
    --                 end
    --             elseif button == "r" then
    --                 if modifiers == "s" then
    --                     print "lspsaga" -- shift right click to print "lspsaga"
    --                 end -- jump to node's ending line+char
    --                 vim.fn.cursor(en.line + 1, en.character + 1)
    --             elseif button == "m" then
    --                 -- middle click to visual select node
    --                 vim.fn.cursor(st.line + 1, st.character + 1)
    --                 vim.cmd "normal v"
    --                 vim.fn.cursor(en.line + 1, en.character + 1)
    --             end
    --         end
    -- },
}

vim.keymap.set("n", "<LEADER>lf", "<CMD>Lspsaga lsp_finder<CR>", { desc = "lspsaga: lsp finder" }) -- use <C-t> to jump back
vim.keymap.set({"n","v"}, "<LEADER>ca", "<cmd>Lspsaga code_action<CR>", { desc = "lspsaga: code action" })
vim.keymap.set("n", "<LEADER>rn", "<CMD>Lspsaga rename<CR>", { desc = "lspsaga: rename symbol" })
vim.keymap.set("n", "<LEADER>dl", "<CMD>Lspsaga show_line_diagnostics<CR>", { desc = "lspsaga: show line diagnostic" })
vim.keymap.set("n", "<LEADER>dc", "<CMD>Lspsaga show_cursor_diagnostics<CR>", { desc = "lspsaga: show cursor diagnostic" })
vim.keymap.set("n", "<LEADER>db", "<CMD>Lspsaga show_buf_diagnostics<CR>", { desc = "lspsaga: show buffer diagnostic" })
vim.keymap.set("n", "<LEADER>dk", "<CMD>Lspsaga peek_definition<CR>", { desc = "lspsaga: peek definition" })
vim.keymap.set("n", "<LEADER>-", "<CMD>Lspsaga diagnostic_jump_prev<CR>", { desc = "lspsaga: goto prev diagnostic" })
vim.keymap.set("n", "<LEADER>=", "<CMD>Lspsaga diagnostic_jump_next<CR>", { desc = "lspsaga: goto next diagnostic" })
vim.keymap.set("n", "<LEADER>[", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true, desc = "lspsaga: goto prev error" })
vim.keymap.set("n", "<LEADER>]", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true, desc = "lspsaga: goto next error" })
vim.keymap.set("n","<LEADER>o", "<CMD>Lspsaga outline<CR>", { desc = "lspsaga: outline" })
vim.keymap.set("n", "<LEADER>ci", "<CMD>Lspsaga incoming_calls<CR>", { desc = "lspsaga: call hierachy incoming" })
vim.keymap.set("n", "<LEADER>co", "<CMD>Lspsaga outgoing_calls<CR>", { desc = "lspsaga: call hierachy outcoming" })
