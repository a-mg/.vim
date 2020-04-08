syntax enable                                  " syntax highlighting
set guioptions-=L                              " hide left scrollbar
set mouse=a                                    " always allow mouse

set guifont=Rec\ Mono\ Linear:h14              " ♥ Recursive
set linespace=4                                " increase leading



" enable customization/override of colorschemes
" (has to happen here to fire when setting colorscheme below)
augroup ColorConfig
  autocmd!
  autocmd ColorScheme * execute "runtime! after/colors/" . g:colors_name . ".vim"
augroup END

set background=light
colorscheme pencil



" enable mapping meta/option, except when inserting
" (see :help macmeta)
if has("gui_macvim")
  set macmeta
  augroup MacMeta
    autocmd!
    autocmd InsertEnter * set nomacmeta
    autocmd InsertLeave * set macmeta
  augroup END
endif
