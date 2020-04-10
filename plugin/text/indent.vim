" keep selection when indenting
xnoremap < <gv
xnoremap > >gv

" completely unindent
nnoremap <leader>< mz0d^`z
xnoremap <leader>< mz:s/^\s\+//<cr>:noh<cr>`zgv
