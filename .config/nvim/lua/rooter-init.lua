------- NVIM-ROOTER -------

require('nvim-rooter').setup {
    rooter_patterns = {
        'compile_commands.json',
        '.git',
        'Makefile',
        'Cargo.toml',
        '.gitignore',
        'init.lua',
        'package.json',
        'README.md',
        'README.rst',
        'README'
    },
    manual = true
}
