" enable mapping meta/option, except when inserting
" (see :help macmeta)
if has("gui_macvim")
  set macmeta
  augroup MacMeta
    autocmd!
    autocmd InsertEnter * set nomacmeta
    autocmd InsertLeave * set macmeta
  augroup END
endif
