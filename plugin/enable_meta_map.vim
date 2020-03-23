" enable mapping meta/option, except when inserting
" (see :help macmeta)
set macmeta
augroup MacMeta
  au!
  au InsertEnter * set nomacmeta
  au InsertLeave * set macmeta
augroup END
