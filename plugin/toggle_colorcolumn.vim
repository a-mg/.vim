" set to textwidth
nnoremap <leader>qw :setlocal colorcolumn+=+0<cr>

" add current column
nnoremap <expr> <leader>qa ':setlocal colorcolumn+=' . col('.') . '<cr>'

" remove current column
nnoremap <expr> <leader>qd ':setlocal colorcolumn-=' . col('.') . '<cr>'

" clear
nnoremap <leader>qc :setlocal colorcolumn=<cr>
