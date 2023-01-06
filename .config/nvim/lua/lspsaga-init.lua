------- LSPSAGA.NVIM -------

require('lspsaga').init_lsp_saga{
    move_in_saga = { prev = '<C-k>', next = '<C-j>'},
    diagnostic_header = { " ", " ", " ", " " },
    code_action_lightbulb = {
        -- sign_priority = 20,
        virtual_text = false,
    },
    finder_icons = {
        def = '🔑 ',
        ref = '🧲 ',
        link = '🔗 ',
    },
    finder_action_keys = {
        open = {'o', '<CR>'},
        vsplit = 's',
        split = 'i',
        tabe = 't',
        quit = {'q', '<ESC>'},
    },
    definition_action_keys = {
        edit = '<C-c>o',
        vsplit = '<C-c>v',
        split = '<C-c>i',
        tabe = '<C-c>t',
        quit = 'q',
    },
    rename_action_quit = '<ESC>',
    symbol_in_winbar = {
        enable = true,
        separator = '  ',
        file_formatter = "%:.",
        click_support = function(node, clicks, button, modifiers)
                -- To see all available details: vim.pretty_print(node)
                local st = node.range.start
                local en = node.range['end']
                if button == "l" then
                    if clicks == 2 then
                        -- double left click to do nothing
                    else -- jump to node's starting line+char
                        vim.fn.cursor(st.line + 1, st.character + 1)
                    end
                elseif button == "r" then
                    if modifiers == "s" then
                        print "lspsaga" -- shift right click to print "lspsaga"
                    end -- jump to node's ending line+char
                    vim.fn.cursor(en.line + 1, en.character + 1)
                elseif button == "m" then
                    -- middle click to visual select node
                    vim.fn.cursor(st.line + 1, st.character + 1)
                    vim.cmd "normal v"
                    vim.fn.cursor(en.line + 1, en.character + 1)
                end
            end
    },
    show_outline = {
        win_with = 'LspsagaOutline',
        win_width = 50,
        jump_key = '<CR>',
    }
}

vim.keymap.set("n", "<LEADER>lf", "<CMD>Lspsaga lsp_finder<CR>", { silent = true }) -- use <C-t> to jump back
vim.keymap.set({"n","v"}, "<LEADER>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<LEADER>rn", "<CMD>Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "<LEADER>dl", "<CMD>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<LEADER>dc", "<CMD>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<LEADER>dk", "<CMD>Lspsaga peek_definition<CR>", { silent = true })
vim.keymap.set("n", "<LEADER>-", "<CMD>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "<LEADER>=", "<CMD>Lspsaga diagnostic_jump_next<CR>", { silent = true })
vim.keymap.set("n", "<LEADER>[", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "<LEADER>]", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n","<LEADER>o", "<CMD>Lspsaga outline<CR>",{ silent = true })
