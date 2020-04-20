" open git status
nnoremap <silent> <leader>gs :G<cr>

augroup FugitiveMappings
    autocmd!
    " push commits
    autocmd FileType fugitive nnoremap <silent><buffer> SS :Git push<cr>
augroup END
