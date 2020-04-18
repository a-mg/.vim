setlocal softtabstop=2
setlocal shiftwidth=2

setlocal commentstring=;;%s
setlocal lispwords-=if

if !exists("b:undo_ftplugin")
    let b:undo_ftplugin = ""
endif
let b:undo_ftplugin .=
      \  "| setlocal softtabstop< shiftwidth<"
      \. " commentstring< lispwords<"
