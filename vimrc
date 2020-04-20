" basic settings

set nocompatible                               " vim not vi

filetype plugin indent on                      " allow filetype plugins

set encoding=utf-8                             " text encoding
set visualbell                                 " don't beep
set shortmess+=I                               " no intro page
set updatetime=100                             " faster refresh (signs etc.)
set autoread                                   " reload file when changed

set undofile                                   " save undo history
set backup                                     " enable backups
set noswapfile                                 " don't use swap files
set undodir=~/.vim/cache/undo//
set backupdir=~/.vim/cache/backup//
set viminfo+=n~/.vim/cache/viminfo



" interface

set wildmenu                                   " better ex completion

set splitright                                 " open Vsplits on right

set numberwidth=5                              " better margin
set relativenumber                             " easier motion
set number                                     " current line abs. number
set signcolumn=yes                             " always show signs
set scrolloff=1                                " cusorline margin

set nrformats-=octal                           " allow c-a/c-x on 0__
set nrformats+=alpha                           " allow c-a/c-x on letters

set nostartofline                              " stay in col on vert move

set autoindent                                 " copy indent to new lines
set smartindent                                " autoindent lines
set smarttab                                   " tab = shiftwidth
set tabstop=4                                  " tabs look like 4 spaces
set softtabstop=4                              " indent by 4 spaces
set shiftwidth=4                               " >> by 4
set expandtab                                  " tabs are spaces

set nowrap                                     " don't wrap by default
set linebreak                                  " don't split words

set ignorecase                                 " ignore case
set smartcase                                  " ...unless includes CAPS
set incsearch                                  " search while typing
set hlsearch                                   " highlight matches
set gdefault                                   " default to global replace



" mappings
" (many have moved to plugins)

let mapleader      = ","
let maplocalleader = "\\"

noremap  ; :
nnoremap U <c-r>
nnoremap s :w<cr>

" better regexps by default
nnoremap / /\v
xnoremap / /\v
" clear highlighting
nnoremap <silent> <leader>/ :noh<cr>

" wrap a paragraph
nnoremap Q gqip
xnoremap Q gq

" wrap an entire file
nnoremap <leader>qq mzgggqG`z
