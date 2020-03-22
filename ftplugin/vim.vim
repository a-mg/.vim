" keep line-end comments at same level
" indent to 48 and begin a comment
inoremap <buffer><expr> <c-]> '<esc>:normal! ' . (48 - col('.')) . 'a <esc>a" '

" zip existing comment to match
nnoremap <buffer><expr> <c-]> (48 - col('.')) . 'i <esc>$'
