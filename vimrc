syntax on
set number
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set list
set listchars=tab:▸\ ,trail:▫
set backspace=indent,eol,start
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set scrolloff=5
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
Plug 'mbbill/undotree'
" Plug 'iamcco/markdown-preview.nvim'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'vimwiki/vimwiki'

call plug#end()

color snazzy
let g:SnazzyTransparent = 0


set showcmd
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set clipboard=unnamedplus
