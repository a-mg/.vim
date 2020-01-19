" Hide files
let list_hide_append = ',.DS_Store'
if g:netrw_list_hide !~ list_hide_append
  let g:netrw_list_hide .= list_hide_append
endif

" Allow using escape mappings to exit netrw
nnoremap <buffer> <esc>     <c-^>
nnoremap <buffer> <s-space> <c-^>
