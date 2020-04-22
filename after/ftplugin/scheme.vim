" copy settings from Racket
let s:path = expand('<sfile>:p:h')
execute 'source ' . s:path . '/racket.vim'

" set up slime for SICP
let g:slime_vimterminal_cmd = "racket -l sicp --repl"
