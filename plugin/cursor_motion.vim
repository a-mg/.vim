" move by screen lines, not file lines
" (fixes them for wrapped text)
nnoremap j gj
nnoremap k gk
nnoremap ^ g^
nnoremap $ g$
nnoremap 0 g0

" preserve original motions under g
nnoremap gj j
nnoremap gk k
nnoremap g^ ^
nnoremap g$ $
nnoremap g0 0

" shortcuts for start/end of line
noremap H g^
noremap L g$
