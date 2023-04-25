------- NVIM-TREE -------

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
    hijack_cursor = true,
    sort_by = "case_sensitive",
    view = {
        width = 50,
        mappings = {
            list = {
                { key = "gh", action = "toggle_help"},
                { key = "y",  action = "copy"},
                { key = "c",  action = "copy_name"},
                { key = "C",  action = "copy_path"},
                { key = "gc", action = "copy_absolute_path"},
                { key = "n",  action = "create"},
                { key = "d",  action = "cut"},
                { key = "D",  action = "remove"},
                { key = "th", action = "trash"},
                { key = "a",  action = "rename"},
                { key = "r",  action = "full_rename"},
                { key = "i",  action = "rename_basename"},
                { key = "J",  action = "fast_move_down", action_cb = function() vim.api.nvim_exec("norm 5j", false) end },
                { key = "K",  action = "fast_move_up", action_cb = function() vim.api.nvim_exec("norm 5k", false) end }
            },
        },
    },
    renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        highlight_modified = "icon",
        indent_markers = {
            enable = true,
            inline_arrows = false,
        },
        icons = {
            git_placement = "before",
            modified_placement = "after",
            glyphs = {
                folder = {
                    arrow_closed = " ",
                    arrow_open = " ",
                },
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "",
                    untracked = "",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        special_files = {
            'Cargo.toml',
            'Makefile',
            'package.json',
            'README.md',
            'readme.md',
            'README.rst',
            'README',
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    modified = {
        enable = true,
    },
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true
    },
    git = {
        ignore = false
    }
})

vim.keymap.set('n', 'tt', ":NvimTreeToggle<CR>", { desc = "nivm-tree toggle" })
vim.keymap.set('n', 'tf', ":NvimTreeFocus<CR>", { desc = "nvim-tree focus" })

vim.cmd.highlight({ "NvimTreeModifiedFile", "guifg=#F36E7A" })
