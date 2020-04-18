" close HTML tag
inoremap <buffer> <d-/> </<c-x><c-o>

let b:undo_ftplugin .= "| iunmap <buffer> <d-/>"
