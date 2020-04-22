let g:ripple_repls = {
            \ "racket": "racket",
            \ "ruby":   "irb",
            \ }

let g:ripple_term_command    = "vert terminal ++close"
let g:ripple_enable_mappings = 0

nmap <leader>r <Plug>(ripple_open_repl)
nmap yr        <Plug>(ripple_send_motion)
nmap yR        <Plug>(ripple_send_motion)ip
nmap yr.       <Plug>(ripple_send_previous)
xmap yr        <Plug>(ripple_send_selection)
nmap yrr       <Plug>(ripple_send_line)
