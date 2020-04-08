" move by screen lines, not file lines
" (fixes them for wrapped text)
noremap j gj
noremap k gk
noremap ^ g^
noremap $ g$
noremap 0 g0

" preserve original motions under g
noremap gj j
noremap gk k
noremap g^ ^
noremap g$ $
noremap g0 0



" shortcuts for start/end of line
noremap H g^
noremap L g$

" vertical seeking: move the cursor to the furthest neighboring line that has
" a char in the same column as the cursor's current position. this is
" equivalent to the first/last line of the paragraph, or the line immediately
" before the motion } or after {.
function! s:Seek(dir, gv) abort
  " restore selection in visual mode (calling a function clears it)
  if a:gv
    normal! gv
  endif
  " check the next line in the direction (1 = down, -1 = up) and move
  while getline(line('.') + a:dir)[col('.') - 1] !=? ""
    execute "normal! " . (a:dir == 1 ? "j" : "k")
  endwhile
endfunction

nnoremap <silent> J :call      <SID>Seek( 1, 0)<cr>
nnoremap <silent> K :call      <SID>Seek(-1, 0)<cr>
xnoremap <silent> J :<c-u>call <SID>Seek( 1, 1)<cr>
xnoremap <silent> K :<c-u>call <SID>Seek(-1, 1)<cr>
