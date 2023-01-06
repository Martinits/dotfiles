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
        requires = 'kyazdani42/nvim-web-devicons',
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
    -- use {
    --     'RRethy/vim-illuminate',
    --     config = function()
    --         vim.cmd([[
    --             augroup illuminate_augroup
    --                 autocmd!
    --                 autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline guisp=darkgrey
    --             augroup END
    --         ]])
    --     end
    -- }
    use 'p00f/nvim-ts-rainbow'
    use 'nvim-tree/nvim-web-devicons'
    use {
        'chentoast/marks.nvim',
        config = function()
            require'marks'.setup()
        end
    }
    use 'sitiom/nvim-numbertoggle'
    use {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async',
        config = function()
            require('ufo-init')
        end
    }
    -- coding, completion and debug
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('lsp-init')
        end
    }
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = 'neovim/nvim-lspconfig',
        config = function()
            require("lspsaga-init")
        end,
    })
    -- use {
    --     "SmiteshP/nvim-navic",
    --     requires = "neovim/nvim-lspconfig",
    --     config = function()
    --         require('navic-init')
    --     end
    -- }
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
            -- 'rcarriga/cmp-dap',
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
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('treesitter-init')
        end
    }
    use {
        'puremourning/vimspector', -- viml!!!
        config = function()
            vim.g.vimspector_base_dir = '/home/martinit/.local/share/nvim/plugged/vimspector'
        end
    }
    use {
        'liuchengxu/vista.vim', -- viml!!!
        config = function()
            vim.keymap.set('n', '<F8>', ':Vista!!<CR>')
        end
    }
    use {
        'nvim-pack/nvim-spectre',
        config = function()
            vim.keymap.set('n', '<leader>F',  [[<cmd>lua require('spectre').open()<CR>]])
            vim.keymap.set('n', '<leader>fw', [[<cmd>lua require('spectre').open_visual({select_word=true})<CR>]])
            vim.keymap.set('v', '<leader>f',  [[<cmd>lua require('spectre').open_visual()<CR>]])
            vim.keymap.set('n', '<leader>fp', [[viw:lua require('spectre').open_file_search()<cr>]])
        end
    }
    use 'AndrewRadev/splitjoin.vim' -- viml!!!
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- text process
    use {
        'svermeulen/vim-subversive', -- viml!!!
        config = function()
            -- s for substitute
            vim.keymap.set('n', 's',          [[<plug>(SubversiveSubstitute)]])
            vim.keymap.set('n', 'ss',         [[<plug>(SubversiveSubstituteLine)]])
            vim.keymap.set('n', '<LEADER>s',  [[<plug>(SubversiveSubstituteRange)]])
            vim.keymap.set('x', '<LEADER>s',  [[<plug>(SubversiveSubstituteRange)]])
            vim.keymap.set('n', '<LEADER>ss', [[<plug>(SubversiveSubstituteWordRange)]])
        end
    }
    use {
        'junegunn/vim-easy-align', -- viml!!!
        config = function()
            vim.keymap.set('x', 'ga', [[<use>(EasyAlign)]])
            vim.keymap.set('n', 'ga', [[<use>(EasyAlign)]])
        end
    }
    use 'easymotion/vim-easymotion' -- viml!!!
    use 'dhruvasagar/vim-table-mode' -- viml!!!
    use 'davidgranstrom/nvim-markdown-preview' -- viml!!!
    use 'mzlogin/vim-markdown-toc' -- viml!!!
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent-init')
        end
    }
    use {
        'kylechui/nvim-surround',
        config = function()
            require("nvim-surround").setup()
        end
    }
    use {
        'mg979/vim-visual-multi', -- viml!!!
        branch = 'master'
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('autopairs-init')
        end
    }
    use 'andymass/vim-matchup' -- viml!!!
    use {
        'godlygeek/tabular', -- viml!!!
        config = function()
            vim.keymap.set('', 'tb', ':Tabularize<SPACE>/')
        end
    }
    use 'gcmt/wildfire.vim' -- viml!!!
    use 'tpope/vim-repeat' -- viml!!!
    -- use {
    --     'ggandor/lightspeed.nvim',
    --     config = function()
    --         vim.cmd([[nmap <expr> f reg_recording() . reg_executing() == "" ? "<use>Lightspeed_f" : "f"]])
    --         vim.cmd([[nmap <expr> F reg_recording() . reg_executing() == "" ? "<use>Lightspeed_F" : "F"]])
    --         vim.cmd([[nmap <expr> t reg_recording() . reg_executing() == "" ? "<use>Lightspeed_t" : "t"]])
    --         vim.cmd([[nmap <expr> T reg_recording() . reg_executing() == "" ? "<use>Lightspeed_T" : "T"]])
    --         vim.cmd([[map <nowait> " <use>Lightspeed_omni_s]])
    --     end
    -- }
    use {
        'fedepujol/move.nvim',
        config = function()
            vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>',    {silent = true})
            vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>',   {silent = true})
            vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>',   {silent = true})
            vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>',  {silent = true})
            vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>',   {silent = true})
            vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>',  {silent = true})
            vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>',  {silent = true})
            vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', {silent = true})
        end
    }
    -- addition
    use {
        'preservim/nerdtree', -- viml!!!
        config = function()
            vim.keymap.set('', 'tt', ':NERDTreeToggle<CR>')
            vim.g.NERDTreeGitStatusUseNerdFonts = 1
        end
    }
    use 'Xuyuanp/nerdtree-git-plugin' -- viml!!!
    use 'tiagofumo/vim-nerdtree-syntax-highlight' -- viml!!!
    use {
        'kevinhwang91/rnvimr',
        config = function()
            require('rnvimr-init')
        end
    }
    use {
        'mbbill/undotree', -- viml!!!
        config = function()
            vim.keymap.set('n', '<F5>', ':UndotreeToggle<CR>')
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
    use {
        'junegunn/fzf', -- viml!!!
        run = './install --all'
    }
    use 'junegunn/fzf.vim' -- viml!!!
    use {
        'tversteeg/registers.nvim',
	config = function()
	    require("registers").setup()
	end
    }
    use {
        'petertriho/nvim-scrollbar',
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
        config = function()
            require("toggleterm").setup{
                open_mapping = [[<C-\>]],
                direction = 'float',
                float_opts = {
                    border = 'curved',
                }
            }
        end
    }
    use {
        'kevinhwang91/nvim-bqf',
        requires = {
            'junegunn/fzf',
            'nvim-treesitter/nvim-treesitter'
        },
        ft = 'qf'
    }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'jvgrootveld/telescope-zoxide',
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('telescope-init')
        end
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
    use {
        'rcarriga/nvim-notify',
        config = function()
            require('notify-init')
        end
    }
    -- git
    use {
        'tanvirtin/vgit.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('vgit-init')
        end
    }
    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('diffview').setup()
        end
    }
    -- others
    use {
        'klen/nvim-config-local',
        config = function()
            require('config-local').setup {
                -- Default configuration (optional)
                config_files = { ".init.lua", ".init.vim" },
                silent = true,
                lookup_parents = true,
            }
        end
    }
    use {
        'airblade/vim-rooter', -- viml!!!
        config = function()
            vim.g.rooter_patterns = {
                '.git',
                'Makefile',
                'Cargo.toml',
                'init.vim',
                '.gitig',
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
            vim.g.suda_smart_edit = 1
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
end)
