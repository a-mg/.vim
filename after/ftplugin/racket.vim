setlocal softtabstop=2
setlocal shiftwidth=2

setlocal commentstring=;;%s
setlocal lispwords-=if

" wlangstroth/vim-racket doesn't set b:undo_ftplugin, so we need to define it
" explicitly, not append to it, for now (see pull request #53)
let b:undo_ftplugin =
      \  "setlocal softtabstop< shiftwidth<"
      \. " commentstring< lispwords<"
