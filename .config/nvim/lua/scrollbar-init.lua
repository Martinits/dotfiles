------- NVIM-SCROLLBAR -------

require("scrollbar").setup({
    handle = {
        color = '#888888',
    },
    marks = {
        Search = { color = '#ff88ff' },
        Error = { color = '#ff0000' },
        Warn = { color = '#ff8800' },
        Info = { color = '#0000ff' },
        Hint = { color = '#00ff00' },
        Misc = { color = '#ffff00' },
    }
})
require("scrollbar.handlers.search").setup()
