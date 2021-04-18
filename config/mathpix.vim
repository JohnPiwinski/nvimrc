nnoremap mmi :call MathPix()<CR>
nnoremap mmd :call MathDis()<CR>
function! MathPix()
    read !python3 ~/.mathpix/python/SimplePaintInline.py inl 
endfunction

function! MathDis()
    read !python3 ~/.mathpix/python/SimplePaintDisplay.py dsp
endfunction
