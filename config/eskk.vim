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

setlocal dictionary+=/usr/share/dict/words
setlocal dictionary+=/usr/share/dict/american-english