----------------------------------------------
--  ____  _    _   _  ____ ___ _   _ ____   --
-- |  _ \| |  | | | |/ ___|_ _| \ | / ___|  --
-- | |_) | |  | | | | |  _ | ||  \| \___ \  --
-- |  __/| |__| |_| | |_| || || |\  |___) | --
-- |_|   |_____\___/ \____|___|_| \_|____/  --
--                                          --
----------------------------------------------


------- AUTO INSTALL PACKER.NVIM -------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

------- PLUGINS VIA PACKER.NVIM -------
return require('packer').startup(function(use)
    -- packer itself
    use 'wbthomason/packer.nvim'
    -- theme, color, highlight, ui
    use {
        'martinits/nvim-snazzi',
        config = function()
            vim.cmd.colorscheme('snazzi')
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('lualine-init')
        end
    }
    use {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        after = 'nvim-snazzi',
        config = function()
            require('bufferline-init')
        end
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require'colorizer'.setup()
        end
    }
    use 'p00f/nvim-ts-rainbow'
    use 'nvim-tree/nvim-web-devicons'
    use {
        'chentoast/marks.nvim',
        config = function()
            require'marks'.setup()
        end
    }
    use 'sitiom/nvim-numbertoggle'
    -- coding, completion and debug
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('lsp-init')
        end
    }
    use {
        "glepnir/lspsaga.nvim",
        commit = "db0c141",
        requires = 'neovim/nvim-lspconfig',
        config = function()
            require("lspsaga-init")
        end,
    }
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require('signature-init')
        end
    }
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("cmp-init")
        end,
        requires = {
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
                "KadoBOT/cmp-plugins",
                config = function()
                    require("cmp-plugins").setup({
                        files = { "plugins.lua" }
                    })
                end,
            },
            {
                'saecki/crates.nvim',
                requires = 'nvim-lua/plenary.nvim',
                config = function()
                    require('crates').setup()
                end,
            },
            {
                'petertriho/cmp-git',
                requires = 'nvim-lua/plenary.nvim',
                config = function()
                    require("cmp_git").setup()
                end
            }
        }
    }
    use {
        "rafamadriz/friendly-snippets",
        requires = 'L3MON4D3/LuaSnip',
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    }
    use {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('bqf').setup()
        end
    }
    use {
        'mfussenegger/nvim-dap',
        config = function()
            require('dap-init')
        end
    }
    use {
        "rcarriga/nvim-dap-ui",
        requires = "mfussenegger/nvim-dap",
        config = function()
            require('dapui-init')
        end
    }
    use {
        'theHamsta/nvim-dap-virtual-text',
        requires = {
            'mfussenegger/nvim-dap',
            'nvim-treesitter/nvim-treesitter'
        },
        config = function()
            require('dapvt-init')
        end
    }
    -- text process
    use {
        'nvim-treesitter/nvim-treesitter',
        -- run = ':TSUpdate',
        config = function()
            require('treesitter-init')
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('textobjects-init')
        end
    }
    use {
        'RRethy/nvim-treesitter-endwise',
        requires = 'nvim-treesitter/nvim-treesitter'
    }
    use {
        'numToStr/Comment.nvim',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require('todo-init')
        end
    }
    use {
        'Wansmer/treesj',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('treesj-init')
        end,
    }
    use {
        'kevinhwang91/nvim-ufo',
        requires = {
            'kevinhwang91/promise-async',
            'nvim-treesitter/nvim-treesitter'
        },
        config = function()
            require('ufo-init')
        end
    }
    use {
        'gbprod/substitute.nvim',
        config = function()
            require('substitute-init')
        end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent-init')
        end
    }
    use {
        'kylechui/nvim-surround',
        tag = "*",
        requires = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-treesitter/nvim-treesitter-textobjects'
        },
        config = function()
            require("nvim-surround").setup()
        end
    }
    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require('hop-init')
        end
    }
    use {
        'hinell/move.nvim',
        config = function()
            require('move-init')
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('autopairs-init')
        end
    }
    use {
        'windwp/nvim-ts-autotag',
        requires = 'nvim-treesitter/nvim-treesitter'
    }
    use {
        'nvim-pack/nvim-spectre',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('spectre-init')
        end
    }
    use 'dhruvasagar/vim-table-mode' -- viml!!!
    use {
        'mg979/vim-visual-multi', -- viml!!!
        branch = 'master'
    }
    use {
        'junegunn/vim-easy-align', -- viml!!!
        config = function()
            vim.keymap.set('x', 'ga', [[<Plug>(EasyAlign)]], {desc = 'easy align'})
            vim.keymap.set('n', 'ga', [[<Plug>(EasyAlign)]], {desc = 'easy align'})
        end
    }
    use {
        'godlygeek/tabular', -- viml!!!
        config = function()
            vim.keymap.set('', '<LEADER>tb', ':Tabularize<SPACE>/')
        end
    }
    use 'andymass/vim-matchup' -- viml!!!
    use 'tpope/vim-repeat' -- viml!!!
    -- addition
    use 'ellisonleao/glow.nvim'
    use {
        'toppair/peek.nvim',
        run = 'deno task --quiet build:fast',
        config = function()
            require('peek-init')
        end
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('tree-init')
        end
    }
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            {'kkharji/sqlite.lua', module = 'sqlite'},
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('neoclip-init')
        end,
    }
    use {
        'petertriho/nvim-scrollbar',
        requires = {
            'kevinhwang91/nvim-hlslens',
            'lewis6991/gitsigns.nvim'
        },
        config = function()
            require('scrollbar-init')
        end
    }
    use {
        'kevinhwang91/nvim-hlslens',
        requires = 'kevinhwang91/nvim-ufo',
        config = function()
            require('hlslens-init')
        end
    }
    use {
        'akinsho/toggleterm.nvim',
        tag = '*',
        config = function()
            require('toggleterm-init')
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make'
            },
            -- 'nvim-telescope/telescope-ui-select.nvim'
        },
        config = function()
            require('telescope-init')
        end
    }
    use {
        'rcarriga/nvim-notify',
        config = function()
            require('notify-init')
        end
    }
    use {
        'j-hui/fidget.nvim',
        requires = 'neovim/nvim-lspconfig',
        config = function()
            require('fidget-init')
        end
    }
    use {
        'kevinhwang91/rnvimr', -- viml!!!
        config = function()
            require('rnvimr-init')
        end
    }
    use {
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
    }
    -- git
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns-init')
        end
    }
    use {
        'sindrets/diffview.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('diffview').setup()
        end
    }
    -- others
    use {
        'rmagatti/auto-session',
        config = function()
            require('autosession-init')
        end
    }
    use {
        'ethanholz/nvim-lastplace',
        config = function()
            require('lastplace-init')
        end
    }
    use {
        'folke/which-key.nvim',
        config = function()
            require('whichkey-init')
        end
    }
    use {
        'klen/nvim-config-local',
        config = function()
            require('config-local').setup {
                config_files = { ".init.lua", ".init.vim" },
                silent = true,
                lookup_parents = true,
            }
        end
    }
    use {
        'notjedi/nvim-rooter.lua',
        config = function()
            require('rooter-init')
        end
    }
    use {
        'airblade/vim-rooter', -- viml!!!
        config = function()
            vim.g.rooter_patterns = {
                'complie_commands.json',
                '.git',
                'Makefile',
                'Cargo.toml',
                '.gitignore',
                'init.lua',
                'package.json',
                'README.md',
                'README.rst',
                'README'
            }
        end
    }
    use {
        'lambdalisue/suda.vim', -- viml!!!
        config = function()
            vim.g.suda_smart_edit = 0
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
