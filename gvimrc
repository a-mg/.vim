syntax enable

" hide left scrollbar
set guioptions-=L

set guifont=Rec\ Mono\ Linear\ Static:h14
set linespace=4

set background=light
colorscheme pencil

" statusline (change for colorschemes)
hi link StatusLinePath     WildMenu
hi link StatusLineModified CursorLineNr

" enable mapping meta/option, except when inserting
set macmeta
augroup MacMeta
  au!
  au InsertEnter * set nomacmeta
  au InsertLeave * set macmeta
augroup END

" maximize window
nnoremap <m-m> :set columns=1000<cr>:set lines=1000<cr>
