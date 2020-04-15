" highlight trailing whitespace
highlight link TrailingWhiteSpace Error
augroup TrailingWhiteSpace
    autocmd!
    autocmd BufEnter    * match TrailingWhiteSpace /\s\+$/
    autocmd InsertEnter * match TrailingWhiteSpace /\s\+\%#\@<!$/
    autocmd InsertLeave * match TrailingWhiteSpace /\s\+$/
augroup END

" clear trailing whitespace
nnoremap <leader>tw :%s/\s\+$//<cr>:noh<cr>
