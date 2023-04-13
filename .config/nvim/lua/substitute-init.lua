------- SUBSTITUTE.NVIM -------

require("substitute").setup{}

vim.keymap.set("n", "s", "<CMD>lua require('substitute').operator()<CR>", { desc = "swap" })
vim.keymap.set("n", "ss", "<CMD>lua require('substitute').line()<CR>", { desc = "swap line" })
vim.keymap.set("n", "S", "<CMD>lua require('substitute').eol()<CR>", { desc = "swap till end of line" })
vim.keymap.set("x", "s", "<CMD>lua require('substitute').visual()<CR>", { desc = "visual mode swap" })
vim.keymap.set("n", "<LEADER>ss", "<CMD>lua require('substitute.range').operator()<CR>", { desc = "swap in range" })
vim.keymap.set("x", "<LEADER>ss", "<CMD>lua require('substitute.range').visual()<CR>", { desc = "visual mode swap in range" })
vim.keymap.set("n", "<LEADER>sw", "<CMD>lua require('substitute.range').word()<CR>", { desc = "swap word in range" })
