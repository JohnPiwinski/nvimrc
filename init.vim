
" -----------------------------------------------------------------------------
"  GENERAL SETTINGS FOR EVERYONE
"  ----------------------------------------------------------------------------
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

if has("nvim")
    set inccommand="nosplit"
endif

set autoread " autoread files
set mouse=a " use mouse for scroll or window size

" -----------------------------------------------------------------------------
"  PLUGIN SETUP
"  ----------------------------------------------------------------------------
" Autoload vim plug if not already there

if has("nvim")
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        " autocmd VimEnter * PlugInstall
    endif
else 
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        " autocmd VimEnter * PlugInstall
    endif
endif

" All the plugins are listed here
if has('nvim')
    call plug#begin('~/.config/nvim/plug.vim')
else
    call plug#begin('~/.vim/plug.vim')
endif
" Productivity
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }

" Programming plugins
Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips', { 'for': ['markdown', 'tex', 'latex'] }
Plug 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'tex', 'latex'] }
Plug 'vhdirk/vim-cmake'
Plug 'fatih/vim-go'
let g:go_version_warning = 0

Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-clang'
Plug 'vhdirk/vim-cmake'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/c.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='monochrome'
Plug 'tyru/eskk.vim'
Plug 'shougo/neocomplete.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'chiel92/vim-autoformat'
Plug 'fatih/vim-go'
call plug#end() " start all the plugins above
" -----------------------------------------------------------------------------
"  VIMTEX OPTIONS
"  ----------------------------------------------------------------------------
if has('unix')
    if has('mac')
        let g:vimtex_view_method = "skim"
        let g:vimtex_view_general_viewer
                \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
        let g:vimtex_view_general_options = '-r @line @pdf @tex'

        " This adds a callback hook that updates Skim after compilation
        let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
        function! UpdateSkim(status)
            if !a:status | return | endif

            let l:out = b:vimtex.out()
            let l:tex = expand('%:p')
            let l:cmd = [g:vimtex_view_general_viewer, '-r']
            if !empty(system('pgrep Skim'))
            call extend(l:cmd, ['-g'])
            endif
            if has('nvim')
            call jobstart(l:cmd + [line('.'), l:out, l:tex])
            elseif has('job')
            call job_start(l:cmd + [line('.'), l:out, l:tex])
            else
            call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
            endif
        endfunction
    else
        let g:latex_view_general_viewer = "zathura"
        let g:vimtex_view_method = "zathura"
        let g:vimtex_quickfix_mode=0
    endif
elseif has('win32')

endif

let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif

" One of the neosnippet plugins will conceal symbols in LaTeX which is
" confusing
let g:tex_conceal = ""

" Can hide specifc warning messages from the quickfix window
" Quickfix with Neovim is broken or something
" https://github.com/lervag/vimtex/issues/773
let g:vimtex_quickfix_latexlog = {
            \ 'default' : 1,
            \ 'fix_paths' : 0,
            \ 'general' : 1,
            \ 'references' : 1,
            \ 'overfull' : 1,
            \ 'underfull' : 1,
            \ 'font' : 1,
            \ 'packages' : {
            \   'default' : 1,
            \   'natbib' : 1,
            \   'biblatex' : 1,
            \   'babel' : 1,
            \   'hyperref' : 1,
            \   'scrreprt' : 1,
            \   'fixltx2e' : 1,
            \   'titlesec' : 1,
            \ },
            \}

let g:eskk#dictionary = {
\ 'path': "~/.skk-jisyo",
\ 'sorted': 0,
\ 'encoding': 'utf-8',
\}

let g:eskk#large_dictionary = {
\ 'path': "/usr/share/skk/SKK-JISYO.L",
\ 'sorted': 1,
\ 'encoding': 'euc-jp',
\}

setlocal spell
set spelllang=en_us
set spellfile=~/.config/nvim/spell/en.utf-8.add
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <expr><TAB>  pumvisible() ? "\<C-x><C-o>" : "\<TAB>"
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
set colorcolumn=0
nnoremap <C-Z> u
nnoremap <C-Y> <C-R>
inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>

inoremap <c-s> <Esc>:w<CR>i

" Autoformat
au BufWrite * :Autoformat

" Line numbers
set number

" CTRL-i is next tab
noremap <C-i> :<C-U>tabnext<CR>
inoremap <C-i> <C-\><C-N>:tabnext<CR>
cnoremap <C-i> <C-C>:tabnext<CR>
" CTRL-k is previous tab
noremap <C-k> :<C-U>tabprevious<CR>
inoremap <C-k> <C-\><C-N>:tabprevious<CR>
cnoremap <C-k> <C-C>:tabprevious<CR>

