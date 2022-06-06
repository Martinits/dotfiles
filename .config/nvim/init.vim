filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set number
set relativenumber
set cursorline
set wrap
set hidden
exec "nohlsearch"
set ignorecase
set smartcase
set ttimeout
set ttimeoutlen=100
set updatetime=100
set shortmess+=c

set tabstop=8
set softtabstop=4
set expandtab
set shiftwidth=4
set smartindent
set clipboard=unnamedplus
set signcolumn=yes

if has('mouse')
  set mouse=a
endif
let &t_ut=''
set list
set listchars=tab:▸\ ,trail:▫
set autochdir
set scrolloff=3
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" keymaps
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
noremap Qh :set nosplitright<CR>:vsplit<CR>
noremap Qj :set splitbelow<CR>:split<CR>
noremap Qk :set nosplitbelow<CR>:split<CR>
noremap Ql :set splitright<CR>:vsplit<CR>
noremap QH <C-w>H
noremap QJ <C-w>J
noremap QK <C-w>K
noremap QL <C-w>L
noremap qh <C-w>h
noremap qj <C-w>j
noremap qk <C-w>k
noremap ql <C-w>l
noremap q, <C-w><
noremap q. <C-w>>
noremap q- <C-w>-
noremap q= <C-w>+
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

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdtree' |
  \ Plug 'Xuyuanp/nerdtree-git-plugin' |
  \ Plug 'ryanoasis/vim-devicons' |
  \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
Plug 'mbbill/undotree'
Plug 'dhruvasagar/vim-table-mode'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'junegunn/fzf'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-peekaboo'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
" Plug 'itchyny/vim-cursorword'
Plug 'jiangmiao/auto-pairs'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'andymass/vim-matchup'
Plug 'embear/vim-localvimrc'
Plug 'honza/vim-snippets'
call plug#end()

" color and themes
" airline
let g:airline_theme='dark'
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
color snazzy
let g:SnazzyTransparent = 0

" nerdtree
noremap tt :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1

" tagbar
nnoremap <F8> :TagbarToggle<CR>

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

" highlighting yank
let g:highlightedyank_highlight_duration = 500

" wildfire
nmap <leader>s <Plug>(wildfire-quick-select)

" fastfold
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:rst_fold_enabled = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:zsh_fold_enable = 1
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1
let g:fortran_fold=1
let g:clojure_fold = 1
let g:baan_fold=1
autocmd FileType c,cpp setlocal foldmethod=syntax
autocmd FileType python setlocal foldmethod=indent

" localvimrc
let g:localvimrc_ask = 0

" gitgutter
" nmap <LEADER>gp <Plug>(GitGutterPreviewHunk)
" nmap <LEADER>gs <Plug>(GitGutterStageHunk)
" nmap <LEADER>gu <Plug>(GitGutterUndoHunk)

" indentline
let g:vim_json_conceal=0

" autopairs
let g:AutoPairsShortcutToggle = '<M-n>'

" highlight yanked
au TextYankPost * silent! lua vim.highlight.on_yank({timeout=500})

" ===== coc =====
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
autocmd CursorHold * call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
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
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <LEADER>d  :<C-u>CocList diagnostics<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <LEADER>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <LEADER>s  :<C-u>CocList -I symbols<cr>
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
xmap <leader>x  <Plug>(coc-convert-snippet)
" coc-yank
nnoremap <silent> <LEADER>y  :<C-u>CocList -A --normal yank<CR>
