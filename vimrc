" SYSTEM ###############################################################
" Preamble ============================================================= {{{

" Remove vi compatibility
set nocompatible

" Enable filetype plugins
filetype plugin on

" Text encoding
set encoding=utf-8

" Show partial commands while typing
set showcmd

" Hide the current mode (used for status line replacement)
set noshowmode

" Don't beep constantly
set visualbell

" Disable the intro message
set shortmess+=I

" ====================================================================== }}}
" Keybindings ========================================================== {{{

" Use semicolon for commands
noremap ; :

" Leaders
let mapleader = ","
let maplocalleader = "\\"

" More intuitive redo command
nnoremap U <c-r>

" Write file
nnoremap s :w<cr>

" ====================================================================== }}}
" Local files ========================================================== {{{

" Move undo files to vim directory
set undodir=~/.vim/local/undo//

" Enable backups
set backup
set backupdir=~/.vim/local/backup//

" Swap files
set noswapfile
set directory=~/.vim/local/swap//

" View files
" Makes vim save state: folds, cursor, etc.
set viewdir=~/.vim/local/view//
set viewoptions=folds,cursor

" viminfo file
set viminfo+=n~/.vim/local/info/viminfo

" ====================================================================== }}}
" ######################################################################

" EDITING ENVIRONMENT ##################################################
" Split windows ======================================================== {{{

" Open vertical splits to the right by default
set splitright

" Move between splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Open new empty splits in the specified direction
nnoremap <c-n>h :leftabove vnew<cr>
nnoremap <c-n>j :rightbelow new<cr>
nnoremap <c-n>k :leftabove new<cr>
nnoremap <c-n>l :rightbelow vnew<cr>

" ====================================================================== }}}
" Line numbering ======================================================= {{{

" Set width of number column
set numberwidth=6

" Default to relative line numbering
set relativenumber

" ====================================================================== }}}
" Cursors ============================================================== {{{

" Put a buffer between the cursor and the vertical edges
set scrolloff=1

" ====================================================================== }}}
" ######################################################################

" NAVIGATING TEXT ######################################################
" Motion =============================================================== {{{

" Move by screen lines, not file lines
nnoremap j gj
nnoremap k gk
nnoremap ^ g^
nnoremap $ g$
nnoremap 0 g0

" Swap the original line motions to g- prefixed commands
nnoremap gj j
nnoremap gk k
nnoremap g^ ^
nnoremap g$ $
nnoremap g0 0

" Use capital motions to jump to start and end of line
noremap H g^
noremap L g$

" ====================================================================== }}}
" Searching ============================================================ {{{

" Search case
set ignorecase
set smartcase

" Highlight search terms
set hlsearch

" Search as you type
set incsearch

" Default to global replace
set gdefault

" Use better regular expressions
nnoremap / /\v
vnoremap / /\v

" Clear the last search (clear highlighting)
nnoremap <silent> <leader>/ :noh<cr>

" ====================================================================== }}}
" ######################################################################

" EDITING TEXT #########################################################
" Indentation ========================================================== {{{

" Enable indentation
filetype indent on

" Use automatic indentation
set autoindent
set smartindent
set smarttab

" Tabs are two spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Maintain selection when indenting
vnoremap < <gv
vnoremap > >gv

" ====================================================================== }}}
" Clipboard ============================================================ {{{

" Paste from system clipboard
nnoremap P "*p
vnoremap P "*p

" Yank to system clipboard
nnoremap Y "*y
vnoremap Y "*y
nnoremap YY "*yy

" Restore default behaviors under g
nnoremap gP P
nnoremap gY y$
vnoremap gY y$

" Select the last pasted/changed text
nnoremap <leader>v `[v`]

" ====================================================================== }}}
" Wrapping ============================================================= {{{

" Wrap text in breaks (do not split words)
set wrap linebreak

" Default to not wrap text (for code)
set nowrap

" Do not hard wrap text (by default)
set textwidth=0

" Wrap a paragraph
nnoremap Q gqip
vnoremap Q gq

" Wrap an entire file
nnoremap <leader>qq mzgggqG`z

" ====================================================================== }}}
" ######################################################################

