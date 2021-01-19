function! GetAllSnippets()
  call UltiSnips#SnippetsInCurrentScope(1)
  let list = []
  for [key, info] in items(g:current_ulti_dict_info)
    let parts = split(info.location, ':')
    call add(list, {
      \"text": key,
      \"filename": parts[0],
      \"lnum": parts[1],
      \"context": info.description,
      \})
  endfor
  call setqflist([], ' ', { 'title': 'Snippets', 'items' : list})

  " Open Quickfix list as soon as it is populated
  copen
endfunction