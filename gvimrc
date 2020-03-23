syntax enable                                  " syntax highlighting
set guioptions-=L                              " hide left scrollbar
set mouse=a                                    " always allow mouse

set guifont=Rec\ Mono\ Linear\ Static:h14      " ♥ Recursive
set linespace=4                                " increase leading



" enable customization/override of colorschemes
" (has to happen here to fire when setting colorscheme below)
augroup ColorConfig
  au!
  au ColorScheme * execute "runtime! after/colors/" . g:colors_name . ".vim"
augroup END

set background=light
colorscheme pencil
