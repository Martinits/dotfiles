------- NVIM-TREESITTER -------

vim.o.foldmethod = 'expr'
vim.o.foldexpr = vim.fn['nvim_treesitter#foldexpr']()
vim.o.foldlevel = 100
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "bash", "go", "rust", "python", "cpp", "lua", "markdown"},
    highlight = {
        enable = true,
        -- disable = {"vim"},
    },
    indent = {
        enable = true,
    },
    -- nvim-ts-rainbow
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    autotag = {
        enable = true
    }
}
