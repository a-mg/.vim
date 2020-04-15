" start interactive EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" add delimiters
let g:easy_align_delimiters = {
            \ ")": {
            \     "pattern":       "[()]",
            \     "left_margin":   1,
            \     "right_margin":  0,
            \     "stick_to_left": 0,
            \   },
            \ "_": {
            \     "pattern": "-",
            \     "left_margin":   1,
            \     "right_margin":  0,
            \   },
            \ }
