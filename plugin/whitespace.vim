" add blank lines in normal mode
" (accepts a count)
nnoremap <expr> <leader>o 'mz' . v:count1 . 'o<esc>`z'
nnoremap <expr> <leader>O 'mz' . v:count1 . 'O<esc>`z'
