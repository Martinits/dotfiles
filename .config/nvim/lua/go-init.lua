------- GO.NVIM -------

require('go').setup {
    lsp_inlay_hints = {
        enable = false,
        highlight = 'NonText'
    },
    diagnostic = false,
}

-- auto format before save
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimport()
    end,
    group = format_sync_grp,
})
