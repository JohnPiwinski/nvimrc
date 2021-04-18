let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
cnoremap <C-k> <C-C>:tabprevious<CR>
" nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
nnoremap <C-Z> u
nnoremap <C-Y> <C-R>
inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>

inoremap <c-s> <Esc>:w<CR>i

" noremap f :<C-U>tabnext<CR>
" noremap a :<C-U>tabprevious<CR>
" map d <C-b>H
" map s L<C-f>H
map K <C-b>H
map J L<C-f>H
map l e
map h b
nnoremap <silent> f :set scrolloff=0<CR>VHoL<Esc>:set scrolloff=1<CR>``<C-y>/\%V

nnoremap  y "*y
nnoremap  Y "*Y
nnoremap  p "*p
nnoremap  P "*P
vnoremap y "*y
vnoremap Y "*Y
vnoremap p "*p
vnoremap P "*P

nnoremap  c "*c
nnoremap  C "*C
vnoremap c "*c
vnoremap c "*C
" Tab Management (Yes it's nonstandard but f and t are severely overrated.)

nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

map <F3> :Autoformat<CR>
map <F4> :!wc -l -w -m %<CR>                                             

" Save files and run build script if applicable

noremap w : call Update_and_build()<CR>

function Update_and_build()
    update 
    silent !build.sh
endfunction

