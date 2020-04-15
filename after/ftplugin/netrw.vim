" hide files
let list_hide_append = ',.DS_Store'
if g:netrw_list_hide !~ list_hide_append
    let g:netrw_list_hide .= list_hide_append
endif

let g:netrw_home = expand('~/.vim/local/netrw')

" allow using escape mappings to exit netrw
nnoremap <buffer> <esc> <c-^>
