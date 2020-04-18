setlocal wrap
setlocal textwidth=80
setlocal softtabstop=2
setlocal shiftwidth=2

setlocal spell
setlocal spelllang=en

" break undo sequence at sentence end
inoremap <buffer> . .<c-g>u
inoremap <buffer> ! !<c-g>u
inoremap <buffer> ? ?<c-g>u
inoremap <buffer> , ,<c-g>u

let b:undo_ftplugin .=
            \  "| setlocal wrap< textwidth< softtabstop< shiftwidth<"
            \. "| setlocal spell< spelllang<"
            \. "| iunmap <buffer> ."
            \. "| iunmap <buffer> !"
            \. "| iunmap <buffer> ?"
            \. "| iunmap <buffer> ,"
