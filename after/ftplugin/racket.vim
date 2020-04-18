setlocal softtabstop=2
setlocal shiftwidth=2

setlocal commentstring=;;%s
setlocal lispwords-=if

let b:undo_ftplugin =
      \  "setlocal softtabstop< shiftwidth<"
      \. " commentstring< lispwords<"
