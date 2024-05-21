----------------------------------------------
--  ____  _    _   _  ____ ___ _   _ ____   --
-- |  _ \| |  | | | |/ ___|_ _| \ | / ___|  --
-- | |_) | |  | | | | |  _ | ||  \| \___ \  --
-- |  __/| |__| |_| | |_| || || |\  |___) | --
-- |_|   |_____\___/ \____|___|_| \_|____/  --
--                                          --
----------------------------------------------

------- AUTO-INSTALL PLUGIN MANAGER LAZY.NVIM -------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

------- PLUGINS VIA LAZY.NVIM -------
require("lazy").setup({
    -- theme, color, highlight, ui
    {
        'martinits/nvim-snazzi',
        config = function()
            vim.cmd.colorscheme('snazzi')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('lualine-init')
        end
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-snazzi',
        },
        version = "*",
        config = function()
            require('bufferline-init')
        end
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    },
    { 'hiphish/rainbow-delimiters.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    {
        'chentoast/marks.nvim',
        config = function()
            require('marks').setup()
        end
    },
    { 'sitiom/nvim-numbertoggle' },
    -- coding, completion and debug
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('lsp-init')
        end,
    },
    {
        'folke/neoconf.nvim',
    },
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'nvim-tree/nvim-web-devicons',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('lspsaga-init')
        end,
    },
    {
        'j-hui/fidget.nvim',
        dependencies = 'neovim/nvim-lspconfig',
        tag = 'legacy',
        config = function()
            require('fidget-init')
        end
    },
    {
        'ray-x/lsp_signature.nvim',
        config = function()
            require('signature-init')
        end
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require('cmp-init')
        end,
        dependencies = {
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-calc',
            'f3fora/cmp-spell',
            'hrsh7th/cmp-nvim-lsp-document-symbol',
            'hrsh7th/cmp-emoji',
            'ray-x/cmp-treesitter',
            'rcarriga/cmp-dap',
            {
                'KadoBOT/cmp-plugins',
                config = function()
                    require('cmp-plugins').setup({
                        files = { 'plugins.lua' }
                    })
                end,
            },
            {
                'saecki/crates.nvim',
                dependencies = 'nvim-lua/plenary.nvim',
                config = function()
                    require('crates').setup {}
                end,
            },
            {
                'petertriho/cmp-git',
                dependencies = 'nvim-lua/plenary.nvim',
                config = function()
                    require('cmp_git').setup()
                end
            }
        }
    },
    {
        'rafamadriz/friendly-snippets',
        dependencies = 'L3MON4D3/LuaSnip',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
        end
    },
    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('bqf-init')
        end
    },
    {
        'mfussenegger/nvim-dap',
        config = function()
            require('dap-init')
        end
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        config = function()
            require('dapui-init')
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-treesitter/nvim-treesitter'
        },
        config = function()
            require('dapvt-init')
        end
    },
    -- text process
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('treesitter-init')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('textobjects-init')
        end
    },
    {
        'RRethy/nvim-treesitter-endwise',
        dependencies = 'nvim-treesitter/nvim-treesitter'
    },
    {
        'numToStr/Comment.nvim',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('Comment').setup()
        end
    },
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-init')
        end
    },
    {
        'Wansmer/treesj',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('treesj-init')
        end,
    },
    {
        'gbprod/substitute.nvim',
        config = function()
            require('substitute-init')
        end
    },
    {
        'kylechui/nvim-surround',
        version = '*',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-treesitter/nvim-treesitter-textobjects'
        },
        config = function()
            require('nvim-surround').setup()
        end
    },
    {
        'fedepujol/move.nvim',
        config = function()
            require('move-init')
        end
    },
    {
        'windwp/nvim-autopairs',
        config = function()
            require('autopairs-init')
        end
    },
    {
        'windwp/nvim-ts-autotag',
        dependencies = 'nvim-treesitter/nvim-treesitter'
    },
    { 'mg979/vim-visual-multi' }, -- viml!!!
    {
        'junegunn/vim-easy-align', -- viml!!!
        config = function()
            vim.keymap.set('x', 'ga', [[<Plug>(EasyAlign)]], {desc = 'easy align'})
            vim.keymap.set('n', 'ga', [[<Plug>(EasyAlign)]], {desc = 'easy align'})
        end
    },
    {
        'godlygeek/tabular', -- viml!!!
        config = function()
            vim.keymap.set('', '<LEADER>tb', ':Tabularize<SPACE>/')
        end
    },
    { 'andymass/vim-matchup' }, -- viml!!!
    { 'tpope/vim-repeat' }, -- viml!!!
    -- search, replace and jump
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            },
            -- 'nvim-telescope/telescope-ui-select.nvim'
        },
        config = function()
            require('telescope-init')
        end
    },
    {
        'nvim-pack/nvim-spectre',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('spectre-init')
        end
    },
    {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require('hop-init')
        end
    },
    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     ---@type Flash.Config
    --     opts = {},
    --     -- stylua: ignore
    --     keys = {
    --         { "<LEADER>jj", mode = { "n", "x", "o" },
    --           function() require("flash").jump() end, desc = "flash: jump" },
    --         { "<LEADER>jt", mode = { "n", "o", "x" },
    --           function() require("flash").treesitter() end, desc = "flash: treesitter" },
    --         { "r", mode = "o",
    --           function() require("flash").remote() end, desc = "flash: remote" },
    --         { "R", mode = { "o", "x" },
    --           function() require("flash").treesitter_search() end,
    --           desc = "flash: treesitter search" },
    --         { "<C-S>", mode = { "c" },
    --           function() require("flash").toggle() end,
    --           desc = "flash: toggle treesitter_search" },
    --     },
    -- },
    -- markdown
    {
        'ellisonleao/glow.nvim',
        config = function()
            require("glow").setup()
        end
    },
    {
        'toppair/peek.nvim',
        build = 'deno task --quiet build:fast',
        config = function()
            require('peek-init')
        end
    },
    {
        'kaymmm/bullets.nvim',
        config = function()
            require('Bullets').setup{}
        end
    },
    { 'dhruvasagar/vim-table-mode' }, -- viml!!!
    -- file explorer
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('tree-init')
        end
    },
    {
        'kevinhwang91/rnvimr', -- viml!!!
        config = function()
            require('rnvimr-init')
        end
    },
    -- ui addition
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async',
            'nvim-treesitter/nvim-treesitter'
        },
        config = function()
            require('ufo-init')
        end
    },
    -- {
    --     'lukas-reineke/indent-blankline.nvim',
    --     dependencies = 'nvim-treesitter/nvim-treesitter',
    --     config = function()
    --         require('indent-init')
    --     end
    -- },
    {
        'shellRaining/hlchunk.nvim',
        -- lazy = false,
        event = { "UIEnter" },
        config = function()
            require('hlchunk-init')
        end
    },
    {
        'petertriho/nvim-scrollbar',
        dependencies = {
            'kevinhwang91/nvim-hlslens',
            'lewis6991/gitsigns.nvim'
        },
        config = function()
            require('scrollbar-init')
        end
    },
    {
        'kevinhwang91/nvim-hlslens',
        dependencies = 'kevinhwang91/nvim-ufo',
        config = function()
            require('hlslens-init')
        end
    },
    -- {
    --     'Bekaboo/dropbar.nvim',
    --     config = function()
    --         require('dropbar-init')
    --     end
    -- },
    -- additional modules
    {
        'AckslD/nvim-neoclip.lua',
        dependencies = {
            {'kkharji/sqlite.lua'},
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('neoclip-init')
        end,
    },
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        config = function()
            require('toggleterm-init')
        end
    },
    {
        'rcarriga/nvim-notify',
        config = function()
            require('notify-init')
        end
    },
    {
        'stevearc/dressing.nvim',
        config = function()
            require('dressing').setup{}
        end
    },
    {
        'mbbill/undotree', -- viml!!!
        config = function()
            vim.keymap.set('n', '<F2>', ':UndotreeToggle<CR>')
            vim.cmd([[
                if has("persistent_undo")
                    let target_path = expand('~/.undodir')
                    " create the directory and any parent directories
                    " if the location does not exist.
                    if !isdirectory(target_path)
                      call mkdir(target_path, "p", 0700)
                    endif
                    let &undodir=target_path
                    set undofile
                endif
            ]])
        end
    },
    -- git
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns-init')
        end
    },
    {
        'sindrets/diffview.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('diffview').setup()
        end
    },
    -- languages
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go-init")
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
    },
    -- nvim lua dev
    {
        "rafcamlet/nvim-luapad",
    },
    {
        'folke/neodev.nvim',
        opts = {},
    },
    -- others
    {
        'rmagatti/auto-session',
        config = function()
            require('autosession-init')
        end
    },
    {
        'ethanholz/nvim-lastplace',
        config = function()
            require('lastplace-init')
        end
    },
    {
        'folke/which-key.nvim',
        config = function()
            require('whichkey-init')
        end
    },
    {
        'klen/nvim-config-local',
        config = function()
            require('config-local').setup {
                config_files = { '.init.lua', '.init.vim' },
                silent = true,
                lookup_parents = true,
            }
        end
    },
    -- {
    --     'notjedi/nvim-rooter.lua',
    --     config = function()
    --         require('rooter-init')
    --     end
    -- },
    -- {
    --     'airblade/vim-rooter', -- viml!!!
    --     config = function()
    --         vim.g.rooter_patterns = {
    --             'complie_commands.json',
    --             '.git',
    --             'Makefile',
    --             'Cargo.toml',
    --             '.gitignore',
    --             'init.lua',
    --             'package.json',
    --             'README.md',
    --             'README.rst',
    --             'README'
    --         }
    --     end
    -- },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                patterns = {
                    'complie_commands.json',
                    '.git',
                    'Makefile',
                    'Cargo.toml',
                    'go.mod',
                    'go.sum',
                    '.gitignore',
                    'init.lua',
                    'package.json',
                    'README.md',
                    'README.rst',
                    'README'
                },
            }
        end
    },
    {
        'lambdalisue/suda.vim', -- viml!!!
        config = function()
            vim.g.suda_smart_edit = 0
        end
    },
    { 'eandrju/cellular-automaton.nvim' }
},{
    ui = {
        border = 'rounded'
    }
})
