" keep selection when indenting
xnoremap < <gv
xnoremap > >gv

" completely unindent
nnoremap g< mz0d^`z
xnoremap g< mz:s/^\s\+//<cr>:noh<cr>`zgv
