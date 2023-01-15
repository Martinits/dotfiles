------- NVIM-NOTIFY -------

vim.opt.termguicolors = true
vim.notify = require("notify")

require('notify').setup {
    max_width = 50,
    max_height = 10
}
