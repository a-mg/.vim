" basic settings

set nocompatible                               " vim not vi

filetype plugin indent on                      " allow filetype plugins

set encoding=utf-8                             " text encoding
set visualbell                                 " don't beep
set shortmess+=I                               " no intro page
set updatetime=100                             " faster refresh (signs etc.)

set undofile                                   " save undo history
set backup                                     " enable backups
set noswapfile                                 " don't use swap files
set viewoptions=folds,cursor
set undodir=~/.vim/local/undo//
set backupdir=~/.vim/local/backup//
set directory=~/.vim/local/swap//
set viewdir=~/.vim/local/view//
set viminfo+=n~/.vim/local/info/viminfo



" interface

set wildmenu                                   " better ex completion

set splitright                                 " open Vsplits on right

set numberwidth=5                              " better margin
set relativenumber                             " easier motion
set signcolumn=yes                             " always show signs
set scrolloff=1                                " cusorline margin

set autoindent                                 " indent new lines
set smartindent                                " indent new lines
set smarttab                                   " tab = shiftwidth
set tabstop=2                                  " tabs = two spaces
set softtabstop=2                              " tabs = two spaces
set shiftwidth=2                               " >> by 2
set expandtab                                  " tabs = spaces

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
vnoremap / /\v
" clear highlighting
nnoremap <silent> <leader>/ :noh<cr>

" keep selection when indenting
vnoremap < <gv
vnoremap > >gv

" wrap a paragraph
nnoremap Q gqip
vnoremap Q gq

" wrap an entire file
nnoremap <leader>qq mzgggqG`z
