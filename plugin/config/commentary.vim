" invert comments in visual selection
xnoremap <silent> gci :g/./Commentary<cr>:noh<cr>

" duplicate a line or region, commenting the original
nmap <leader>dc yygccp
vmap <leader>dc ygvgc`]p
