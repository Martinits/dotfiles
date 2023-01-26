------- INDENT-BLANKLINE -------

vim.opt.termguicolors = true
vim.opt.list = true
vim.cmd [[highlight IndentBlanklineIndent0 guifg=#C678DD gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#E56C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextStart guisp=#98C379 gui=underline]]

require("indent_blankline").setup {
    -- char_highlight_list = {
    --     "IndentBlanklineIndent0",
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    --     "IndentBlanklineIndent3",
    --     "IndentBlanklineIndent4",
    --     "IndentBlanklineIndent5",
    --     "IndentBlanklineIndent6",
    -- },
    use_treesitter = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
