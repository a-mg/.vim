" set to textwidth
nnoremap <leader>qw :set colorcolumn+=+0<cr>

" add current column
nnoremap <expr> <leader>qa ':set colorcolumn+=' . col('.') . '<cr>'

" remove current column
nnoremap <expr> <leader>qd ':set colorcolumn-=' . col('.') . '<cr>'

" clear
nnoremap <leader>qc :set colorcolumn=<cr>
