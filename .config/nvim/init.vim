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
set signcolumn=yes
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
" theme, color, highlight
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'theniceboy/nvim-deus'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'bbenzikry/snazzybuddy.nvim'
Plug 'Martinits/nvim-snazzi'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'
Plug 'p00f/nvim-ts-rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kshenoy/vim-signature'
" coding, completion and debug
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'liuchengxu/vista.vim'
" Plug 'preservim/tagbar'
Plug 'honza/vim-snippets'
" Plug 'preservim/nerdcommenter'
" Plug 'Konfekt/FastFold'
Plug 'nvim-lua/plenary.nvim' |
    \ Plug 'nvim-pack/nvim-spectre'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'numToStr/Comment.nvim'
" text process
Plug 'svermeulen/vim-subversive'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'lambdalisue/suda.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mzlogin/vim-markdown-toc'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'jiangmiao/auto-pairs'
Plug 'andymass/vim-matchup'
Plug 'godlygeek/tabular'
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-repeat'
Plug 'ggandor/lightspeed.nvim'
Plug 'fedepujol/move.nvim'
" addition
Plug 'preservim/nerdtree' |
  \ Plug 'Xuyuanp/nerdtree-git-plugin' |
  \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'kevinhwang91/rnvimr'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'akinsho/toggleterm.nvim'
Plug 'kevinhwang91/nvim-bqf'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" git
" Plug 'tpope/vim-fugitive'
" Plug 'rbong/vim-flog'
Plug 'cohama/agit.vim'
" others
Plug 'klen/nvim-config-local'
Plug 'airblade/vim-rooter'
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


" ======= COC SETTINGS =======
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-dictionary',
    \ 'coc-docker',
    \ 'coc-emoji',
    \ 'coc-esbonio',
    \ 'coc-git',
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
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" navigate diagnostics
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
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


" ======= PLUGINS SETTINGS =======
" nerdtree
noremap tt :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1

" tagbar
" nnoremap <F8> :TagbarToggle<CR>

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

" wildfire
" nmap <leader>s <Plug>(wildfire-quick-select)

" fastfold
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
" let g:markdown_folding = 1
" let g:rst_fold_enabled = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:zsh_fold_enable = 1
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1
" let g:fortran_fold=1
" let g:clojure_fold = 1
" let g:baan_fold=1
" autocmd FileType c,cpp setlocal foldmethod=syntax
" autocmd FileType python setlocal foldmethod=indent

" indentline
let g:vim_json_conceal=0
let g:indentLine_conceallevel = 0

" autopairs
let g:AutoPairsShortcutToggle = '<M-n>'

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
            \ '<C-t>':  'NvimEdit tabedit',
            \ '<C-x>':  'NvimEdit split',
            \ '<C-v>':  'NvimEdit vsplit',
            \ 'gw':     'JumpNvimCwd',
            \ 'yw':     'EmitRangerCwd'
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
        disable = {"vim"},
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

" vim-hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']

" vim-illuminate
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline guisp=darkgrey
augroup END

" vim-rooter
let g:rooter_patterns = ['.git', 'Makefile', 'Cargo.toml', 'init.vim', '.gitignore', 'init.lua', 'package.json']

" nvim-scrollbar
lua <<EOF
-- require("scrollbar").setup({
--     set_highlights = false
-- })
-- require("scrollbar").setup()
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
require('telescope').load_extension('fzf')
EOF
