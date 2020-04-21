let g:slime_target = "vimterminal"
let g:slime_vimterminal_config = {"vertical": 1}

let g:slime_no_mappings = 1
xmap <leader>s  <Plug>SlimeRegionSend
nmap <leader>s  <Plug>SlimeMotionSend
nmap <leader>ss <Plug>SlimeLineSend
