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

" Remove arrow keys in normal mode (corrective)
noremap <left>  <nop>
noremap <right> <nop>
noremap <up>    <nop>
noremap <down>  <nop>

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

" .netrwhist history file
let g:netrw_home = expand('~/.vim/local/netrw')

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

" Quickly open help files in right vsplit
nnoremap ?? :vert bo help<space>

" ====================================================================== }}}
" Line numbering ======================================================= {{{

" Set width of number column
set numberwidth=6

" Default to relative line numbering
set relativenumber

" ====================================================================== }}}
" Cursors ============================================================== {{{

" Only show the cursorline in the current window
set cursorline
augroup cursorline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
augroup END

" Put a buffer between the cursor and the vertical edges
set scrolloff=1

" ====================================================================== }}}
" Filetypes ============================================================ {{{

nnoremap <leader>ft :setfiletype text<cr>
nnoremap <leader>fh :setfiletype help<cr>

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
" Folding ============================================================== {{{

" Enable code folding
set foldenable

" Don't autofold
set foldlevelstart=99
set foldlevel=99

" Folding method
set foldmethod=syntax

" Folding function
function! MyFoldText()
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + (&relativenumber + &number) * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart(' ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()

" Use space to toggle folds
nnoremap <space> za
vnoremap <space> za

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

" Duplicate a line or region of text
nnoremap <leader>du yyp
vnoremap <leader>du y`]p

" Duplicate a line or region, commenting the original
" (mappings require vim-commentary plugin)
" This should maybe move to a plugin config file someday
nmap <leader>dc yygccp
vmap <leader>dc ygvgc`]p

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

" vim: set fdm=marker fdl=0 :
