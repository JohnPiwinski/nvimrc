filetype plugin indent on
set nocompatible
set autoindent
set nomodeline " disable modeline vulnerability

" text encoding
set encoding=utf8

" use 4 spaces for tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set backspace =indent,eol,start
set hidden
set laststatus =2

" column ruler at 100
set ruler
set colorcolumn=80

" Highlight searching
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase

set inccommand="nosplit"

set autoread " autoread files

" Relative Line Numbers
set number relativenumber

" No Line Folding
set nofoldenable

" Iceberg
colorscheme iceberg

set colorcolumn=0

hi TabLineFill term=bold cterm=bold ctermbg=0