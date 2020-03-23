" toggle a colorcolumn for a given col
function! s:ToggleColumn(col) abort
  if &colorcolumn !~? a:col
    execute "setlocal colorcolumn+=" . a:col
  else
    execute "setlocal colorcolumn-=" . a:col
  endif
endfunction



" toggle at textwidth
nnoremap <silent> <m-w> :call <SID>ToggleColumn("+0")<cr>

" toggle current column
nnoremap <silent> <m-a> :call <SID>ToggleColumn(col('.'))<cr>

" clear all columns
nnoremap <silent> <m-q> :setlocal colorcolumn=<cr>
