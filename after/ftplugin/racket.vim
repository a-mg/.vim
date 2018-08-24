" Change the comment string to semicolons
setlocal commentstring=;;%s

" Correct indentation rules
setlocal lispwords-=if

" Mapping to start a Racket REPL for Slime
nmap <buffer> <leader>ss <c-c><c-c>/Applications/Racket\ v7.0/bin/racket<cr><c-w><s-h>
