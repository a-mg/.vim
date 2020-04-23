" paste from system clipboard
nnoremap P "+p
xnoremap P "+p

" yank to system clipboard
nnoremap Y "+y
xnoremap Y "+y
nnoremap YY "+yy

" restore default behaviors under g
nnoremap gP P

" yank to end of line (matches other capital motions)
nnoremap gY y$
xnoremap gY y$

" select the last pasted/changed text
nnoremap <leader>v `[v`]
