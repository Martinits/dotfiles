------- TODO-COMMENTS.NVIM -------

require("todo-comments").setup{
    keywords = {
        TODO = { icon = " ", color = "info" },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        TEST = { icon = "漣", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
}

vim.keymap.set("n", "<LEADER>tn", function()
    require("todo-comments").jump_next()
end, { desc = "next todo comment" })

vim.keymap.set("n", "<LEADER>tp", function()
    require("todo-comments").jump_prev()
end, { desc = "previous todo comment" })

vim.keymap.set("n", "<LEADER>ts", ":TodoTelescope<CR>", { desc = "search todo with telescope" })
