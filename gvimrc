syntax enable

" hide left scrollbar
set guioptions-=L

set guifont=Rec\ Mono\ Linear\ Static:h14
set linespace=4

set background=light
colorscheme pencil

" statusline (change for colorschemes)
hi link MySLPath WildMenu
hi link MySLMod  CursorLineNr

" enable mapping meta/option, except when inserting
set macmeta
augroup MacMeta
  au!
  au InsertEnter * set nomacmeta
  au InsertLeave * set macmeta
augroup END
