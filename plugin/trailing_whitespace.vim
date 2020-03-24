" highlight trailing whitespace
if exists("g:syntax_on")
  augroup TrailingWhitespace
    autocmd!
    autocmd BufEnter    * match TrailingWhitespace /\s\+$/
    autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match TrailingWhiteSpace /\s\+$/
  augroup END
endif

" clear trailing whitespace
nnoremap <leader>tw :%s/\s\+$//<cr>:noh<cr>
