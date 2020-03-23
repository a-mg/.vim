" paste from system clipboard
nnoremap P "*p
vnoremap P "*p

" yank to system clipboard
nnoremap Y "*y
vnoremap Y "*y
nnoremap YY "*yy

" restore default behaviors under g
nnoremap gP P

" yank to end of line (matches other capital motions)
nnoremap gY y$
vnoremap gY y$

" select the last pasted/changed text
nnoremap <leader>v `[v`]
