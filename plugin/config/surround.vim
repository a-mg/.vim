" don't set default mappings
let g:surround_no_mappings = 1

" surround (in target)
nmap gs <Plug>Ysurround
" surround line
nmap gss <Plug>Yssurround
" surround (in target) with block
nmap gS <Plug>YSurround
" surround line with block
nmap gSS <Plug>YSsurround

" surround selection
xmap gs <Plug>VSurround
" surround selection with block
xmap gS <Plug>VgSurround

" delete surround
nmap ds <Plug>Dsurround
" change surround
nmap cs <Plug>Csurround
" change surrounding block
nmap cS <Plug>CSurround

" insert inline surround
imap <c-s> <Plug>Isurround
" insert block surround
imap <c-s><c-s> <Plug>ISurround



" insert mode shortcuts
imap {<cr> <Plug>ISurround{
