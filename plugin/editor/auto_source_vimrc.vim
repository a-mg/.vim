augroup VimrcEdit
    autocmd!
    autocmd BufWritePost ~/.vim/*.vim,vimrc,gvimrc nested source %
augroup end
