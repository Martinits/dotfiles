"
"                       _   _       _ _   _
"  _ __ ___   __ _ _ __| |_(_)_ __ (_) |_( )___
" | '_ ` _ \ / _` | '__| __| | '_ \| | __|// __|
" | | | | | | (_| | |  | |_| | | | | | |_  \__ \
" |_| |_| |_|\__,_|_|   \__|_|_| |_|_|\__| |___/
"
"                        _                              __ _
"  _ __   ___  _____   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
" | | | |  __/ (_) \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                                            |___/


" ======= AUTO INSTALL VIM-PLUG =======
if empty(glob($HOME.'/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


" ======= BASIC NVIM CONFIG =======
set number
set relativenumber
set cursorline
set wrap
set autochdir
set ignorecase
set smartcase
set timeoutlen=500
set ttimeoutlen=100
set updatetime=100
set shortmess+=c
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set clipboard=unnamedplus
set signcolumn=yes:2
set termguicolors
if has('mouse')
    set mouse=a
endif
" let &t_ut=''
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=3
set inccommand=split
set visualbell
set virtualedit=block
" return to last editing place
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" terminal setting
autocmd TermOpen term://* startinsert
" highlight yanked
au TextYankPost * silent! lua vim.highlight.on_yank({timeout=500})


" ======= KEY MAPPINGS =======
let mapleader=" "
" fast move
noremap H 7h
noremap J 5j
noremap K 5k
noremap L 7l
noremap <C-e> $
noremap <C-s> ^
" join two lines (concatenate)
noremap ct :join<CR>
" search result
noremap = nzz
noremap - Nzz
" nohlsearch
noremap <LEADER>h :nohlsearch<CR>
" number
noremap <LEADER>n :set relativenumber!<CR>
" command
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" split window
" noremap Qh :set nosplitright<CR>:vsplit<CR>
" noremap Qj :set splitbelow<CR>:split<CR>
" noremap Qk :set nosplitbelow<CR>:split<CR>
" noremap Ql :set splitright<CR>:vsplit<CR>
" noremap QH <C-w>H
" noremap QJ <C-w>J
" noremap QK <C-w>K
" noremap QL <C-w>L
" noremap qh <C-w>h
" noremap qj <C-w>j
" noremap qk <C-w>k
" noremap ql <C-w>l
" noremap q, <C-w><
" noremap q. <C-w>>
" noremap q- <C-w>-
" noremap q= <C-w>+
" arrows in command mode
cnoremap <C-s> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-b> <C-Left>
cnoremap <C-f> <C-Right>
" insert mode line edit
inoremap <C-s> <Home>
inoremap <C-e> <End>
" inoremap <C-k> <Up>
" inoremap <C-j> <Down>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>
" inoremap <C-b> <C-Left>
" inoremap <C-f> <C-Right>
" find and replace
noremap \s :%s//gc<left><left><left>

" ======= PLUGINS VIA VIM-PLUG =======
call plug#begin()
" deps
" Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kevinhwang91/promise-async'
" theme, color, highlight, ui
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Martinits/nvim-snazzi'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'RRethy/vim-illuminate'
Plug 'p00f/nvim-ts-rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'chentoast/marks.nvim'
Plug 'sitiom/nvim-numbertoggle'
Plug 'kevinhwang91/nvim-ufo'
" coding, completion and debug
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'liuchengxu/vista.vim'
Plug 'honza/vim-snippets'
Plug 'nvim-pack/nvim-spectre'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'numToStr/Comment.nvim'
" text process
Plug 'svermeulen/vim-subversive'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'dhruvasagar/vim-table-mode'
Plug 'davidgranstrom/nvim-markdown-preview'
Plug 'mzlogin/vim-markdown-toc'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kylechui/nvim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'windwp/nvim-autopairs'
Plug 'andymass/vim-matchup'
Plug 'godlygeek/tabular'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-repeat'
" Plug 'ggandor/lightspeed.nvim'
Plug 'fedepujol/move.nvim'
" addition
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'kevinhwang91/rnvimr'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tversteeg/registers.nvim'
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'akinsho/toggleterm.nvim'
Plug 'kevinhwang91/nvim-bqf'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'jvgrootveld/telescope-zoxide'
" git
Plug 'tanvirtin/vgit.nvim'
Plug 'sindrets/diffview.nvim'
" others
Plug 'klen/nvim-config-local'
Plug 'airblade/vim-rooter'
Plug 'lambdalisue/suda.vim'
call plug#end()


" ======= COLORS AND THEMES =======
" airline
let g:airline_theme='desertink' "dark desertink base16_classic ayu_dark base16_monokai
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = '  '
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ' ☰'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nnoremap <LEADER>tn :tabnew<CR>
nmap <LEADER>1 <Plug>AirlineSelectTab1
nmap <LEADER>2 <Plug>AirlineSelectTab2
nmap <LEADER>3 <Plug>AirlineSelectTab3
nmap <LEADER>4 <Plug>AirlineSelectTab4
nmap <LEADER>5 <Plug>AirlineSelectTab5
nmap <LEADER>6 <Plug>AirlineSelectTab6
nmap <LEADER>7 <Plug>AirlineSelectTab7
nmap <LEADER>8 <Plug>AirlineSelectTab8
nmap <LEADER>9 <Plug>AirlineSelectTab9
nmap <LEADER>0 <Plug>AirlineSelectTab0
nmap <LEADER>- <Plug>AirlineSelectPrevTab
nmap <LEADER>= <Plug>AirlineSelectNextTab

" colortheme
color snazzi

" vim-snazzy
let g:SnazzyTransparent = 0


" ======= PLUGINS SETTINGS =======
" nerdtree
noremap tt :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1

" undotree
nnoremap <F5> :UndotreeToggle<CR>
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

" tabularize
noremap tb :Tabularize<SPACE>/

" vimspector
let g:vimspector_base_dir='/home/martinit/.local/share/nvim/plugged/vimspector'

" rnvimr
tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> <M-o> :RnvimrToggle<CR>
tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>
" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
highlight link RnvimrNormal CursorLine
let g:rnvimr_action = {
    \ '<C-t>' : 'NvimEdit tabedit',
    \ '<C-x>' : 'NvimEdit split',
    \ '<C-v>' : 'NvimEdit vsplit',
    \ 'gw'    : 'JumpNvimCwd',
    \ 'yw'    : 'EmitRangerCwd'
    \ }
" change ranger colorscheme for alacritty
let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set colorscheme jungle']

" subversive
" s for substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap <LEADER>s <plug>(SubversiveSubstituteRange)
xmap <LEADER>s <plug>(SubversiveSubstituteRange)
nmap <LEADER>ss <plug>(SubversiveSubstituteWordRange)

" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" suda.vim
let g:suda_smart_edit = 1

" vista
nnoremap <F8> :Vista!!<CR>

" nvim treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=100
lua <<EOF
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
    }
}
EOF

" vim-illuminate
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi IlluminatedWordText cterm=underline gui=underline
    autocmd VimEnter * hi IlluminatedWordRead cterm=underline gui=underline
    autocmd VimEnter * hi IlluminatedWordWrite cterm=underline gui=underline
augroup END

" vim-rooter
let g:rooter_patterns = [
    \ '.git',
    \ 'Makefile',
    \ 'Cargo.toml',
    \ 'init.vim',
    \ '.gitignore',
    \ 'init.lua',
    \ 'package.json',
    \ 'README.md',
    \ 'README.rst',
    \ 'README'
    \ ]

" nvim-scrollbar
lua <<EOF
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
EOF

" nvim-local-config
lua <<EOF
require('config-local').setup {
    -- Default configuration (optional)
    config_files = { ".init.lua", ".init.vim" },
    silent = true,
    lookup_parents = true,
}
EOF

" nvim-hlslens
lua <<EOF
local kopts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '<Leader>l', ':noh<CR>', kopts)
EOF

" Comment.nvim
lua require('Comment').setup()

" lightspeed
" nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
" nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
" nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
" nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
" map <nowait> " <Plug>Lightspeed_omni_s

" toggleterm
lua <<EOF
require("toggleterm").setup{
    open_mapping = [[<C-\>]],
    direction = 'float',
    float_opts = {
        border = 'curved',
    }
}
EOF

" move.nvim
nnoremap <silent> <A-j> :MoveLine(1)<CR>
nnoremap <silent> <A-k> :MoveLine(-1)<CR>
vnoremap <silent> <A-j> :MoveBlock(1)<CR>
vnoremap <silent> <A-k> :MoveBlock(-1)<CR>
nnoremap <silent> <A-l> :MoveHChar(1)<CR>
nnoremap <silent> <A-h> :MoveHChar(-1)<CR>
vnoremap <silent> <A-l> :MoveHBlock(1)<CR>
vnoremap <silent> <A-h> :MoveHBlock(-1)<CR>

" nvim-spectre
nnoremap <leader>F <cmd>lua require('spectre').open()<CR>
nnoremap <leader>fw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>f <cmd>lua require('spectre').open_visual()<CR>
nnoremap <leader>fp viw:lua require('spectre').open_file_search()<cr>

" nvim-telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
lua <<EOF
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            },
            n = {
                ["<C-c>"] = "close",
            },
        },
    },
}
-- plugs
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('fzf_native')
require'telescope'.load_extension('zoxide')
EOF

" nvim-surround
lua require("nvim-surround").setup()

" marks.nvim
lua <<EOF
require'marks'.setup()
EOF

" nvim-colorizer.lua
lua require'colorizer'.setup()

" nvim-numbertoggle
" lua require("numbertoggle").setup()

" nvim-ufo
lua <<EOF
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = -1
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

-- global handler
require('ufo').setup({
    fold_virt_text_handler = handler,
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end

})
-- buffer scope handler
-- will override global handler if it is existed
local bufnr = vim.api.nvim_get_current_buf()
require('ufo').setFoldVirtTextHandler(bufnr, handler)
-- require('ufo').setup({
--     provider_selector = function(bufnr, filetype, buftype)
--         return {'treesitter', 'indent'}
--     end
-- })
EOF

" indent-blankline.nvim
lua <<EOF
vim.opt.termguicolors = true
vim.opt.list = true
vim.cmd [[highlight IndentBlanklineIndent0 guifg=#C678DD gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#E56C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextStart guisp=#98C379 gui=underline]]
require("indent_blankline").setup {
    -- char_highlight_list = {
    --     "IndentBlanklineIndent0",
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    --     "IndentBlanklineIndent3",
    --     "IndentBlanklineIndent4",
    --     "IndentBlanklineIndent5",
    --     "IndentBlanklineIndent6",
    -- },
    use_treesitter = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" nvim-autopairs
lua <<EOF
require("nvim-autopairs").setup {}
local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')
npairs.setup({
    check_ts = true,
})
local ts_conds = require('nvim-autopairs.ts-conds')
-- press % => %% only while inside a comment or string
npairs.add_rules({
    Rule("%", "%", "lua")
        :with_pair(ts_conds.is_ts_node({'string','comment'})),
    Rule("$", "$", "lua")
        :with_pair(ts_conds.is_not_ts_node({'function'}))
})
EOF

" vgit
lua <<EOF
require('vgit').setup({
    settings = {
        live_blame = {
            enabled = false,
        },
        signs = {
            priority = 9,
        },
    }
})
EOF
nnoremap <LEADER>gp :VGit hunk_up<CR>
nnoremap <LEADER>gn :VGit hunk_down<CR>

" diffview
lua require("diffview").setup()

" registers
lua require('registers').setup()

" ======= COC SETTINGS =======
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-dictionary',
    \ 'coc-docker',
    \ 'coc-emoji',
    \ 'coc-esbonio',
    \ 'coc-go',
    \ 'coc-html',
    \ 'coc-java',
    \ 'coc-json',
    \ 'coc-sumneko-lua',
    \ 'coc-marketplace',
    \ 'coc-omni',
    \ 'coc-perl',
    \ 'coc-phpls',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-r-lsp',
    \ 'coc-rust-analyzer',
    \ 'coc-sh',
    \ 'coc-snippets',
    \ 'coc-solargraph',
    \ 'coc-sql',
    \ 'coc-sumneko-lua',
    \ 'coc-syntax',
    \ 'coc-tag',
    \ 'coc-texlab',
    \ 'coc-toml',
    \ 'coc-translator',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-word',
    \ 'coc-xml',
    \ 'coc-yaml',
    \ 'coc-yank'
    \ ]

" Use tab for trigger completion with characters ahead and navigate.
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <C-f> coc#pum#visible() ? coc#pum#confirm() : "\<C-f>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" navigate diagnostics
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gp <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use gm to show documentation in preview window.
nnoremap <silent> gm :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>m  <Plug>(coc-format-selected)
nmap <leader>m  <Plug>(coc-format-selected)

" json comment support
autocmd FileType json syntax match Comment +\/\/.\+$+

" Applying codeAction to the selected region.
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR     :call CocActionAsync('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" CocList
" Show all diagnostics.
nnoremap <silent><nowait> <LEADER>d  :<C-u>CocList diagnostics<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <LEADER>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <LEADER>b  :<C-u>CocList -I symbols<cr>

" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
xmap <leader>x  <Plug>(coc-convert-snippet)

" coc-yank
nnoremap <silent> <LEADER>y  :<C-u>CocList -A --normal yank<CR>

" coc-translator
nmap <LEADER>ts <Plug>(coc-translator-p)

" for termdebug
packadd termdebug
