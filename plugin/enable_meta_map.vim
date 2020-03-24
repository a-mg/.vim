" enable mapping meta/option, except when inserting
" (see :help macmeta)
set macmeta
augroup MacMeta
  autocmd!
  autocmd InsertEnter * set nomacmeta
  autocmd InsertLeave * set macmeta
augroup END
