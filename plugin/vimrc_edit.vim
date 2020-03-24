nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ee :Vexplore! ~/.vim<cr>

" nnoremap <leader>sv :source $MYVIMRC<cr>

augroup VimrcEdit
  autocmd!
  autocmd BufWritePost ~/.vim/*.vim,vimrc,gvimrc source %
augroup end
