------- NVIM-ROOTER -------

require('nvim-rooter').setup {
    rooter_patterns = {
        '.git',
        '.hg',
        '.svn',
        'Makefile',
        'Cargo.toml',
        '.gitignore',
        'init.lua',
        'package.json',
        'README.md',
        'README.rst',
        'README'
    },
    -- manual = true
}
