" All the plugins are listed here
call plug#begin('~/.config/nvim/plug.vim')
" Productivity
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }

" Programming plugins
Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

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

Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'tex', 'latex', 'text'] }
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

Plug 'deoplete-plugins/deoplete-dictionary'

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
Plug 'leafgarland/typescript-vim'
"Plug 'justinmk/vim-sneak'
Plug 'wikitopian/hardmode'
Plug 'chrisbra/csv.vim'
Plug 'reedes/vim-wordy'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neomake/neomake'

Plug 'cocopon/iceberg.vim'

Plug 'kqito/vim-easy-replace'
let g:easy_replace_launch_key='?'
" Plug 'suan/vim-instant-markdown', {'for': ['markdown', 'md']}
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_mathjax = 1

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'

Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

call plug#end() " start all the plugins above