" highlight trailing whitespace
highlight link TrailingWhitespace Error
augroup TrailingWhitespace
  autocmd!
  autocmd BufEnter    * match TrailingWhitespace /\s\+$/
  autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match TrailingWhiteSpace /\s\+$/
augroup END

" clear trailing whitespace
nnoremap <leader>tw :%s/\s\+$//<cr>:noh<cr>
