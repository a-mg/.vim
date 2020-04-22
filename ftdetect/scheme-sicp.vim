" a scheme .ss file in my sicp repository should actually be considered a
" Racket source file, but with some custom settings
autocmd BufNewFile,BufRead */sicp/*.ss
            \  set filetype=racket
            \| let g:ripple_repls["racket"] = "racket -l sicp --repl"
