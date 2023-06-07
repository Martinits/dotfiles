------- TODO-COMMENTS.NVIM -------

require("todo-comments").setup{
    keywords = {
        TODO = {
            icon = " ",
            color = "info",
            alt = {
                "TODO 1",
                "TODO 2",
                "TODO 3",
                "TODO 4",
                "TODO 5",
                "TODO 6",
                "TODO 7",
                "TODO 8",
                "TODO 9",
                "TODO 0",
            },
        },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
}

vim.keymap.set("n", "<LEADER>tn", function()
    require("todo-comments").jump_next()
end, { desc = "next todo comment" })

vim.keymap.set("n", "<LEADER>tp", function()
    require("todo-comments").jump_prev()
end, { desc = "previous todo comment" })

vim.keymap.set("n", "<LEADER>ts", ":TodoTelescope<CR>", { desc = "search todo with telescope" })
