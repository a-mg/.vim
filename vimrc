" vimrc ================================================================ {{{
" ----------------------------------------------------------------------
" ----------888--888---888---88888b.d88b.----888d888--.d8888b-----------
" ----------888--888---888---888-'888-'88b---888P'---d88P'--------------
" ----------Y88--88P---888---888--888--888---888-----888----------------
" -----------Y8bd8P----888---888--888--888---888-----Y88b.--------------
" ------------Y88P-----888---888--888--888---888------'Y8888P-----------
" ----------------------------------------------------------------------
"
" Author: A. Mattson Gallagher <amg@a-m-g.org>
" Source: https://github.com/a-mg/dotvim
"
" This file contains settings and configuration for the vim editor.
" Only core settings and mappings are included here; any settings
" related to plugins or languages live in other files.
"
" The settings are grouped into sections based on which aspects of
" the editor they modify. All settings should be commented. Commands
" should mostly follow this rule: leader commands affect text, and
" chord commands affect the editor/windows.
"
" References and reading:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" https://hg.stevelosh.com/dotfiles/file/tip/vim/vimrc
" https://github.com/emilyst/home
"
" ====================================================================== }}}

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

" Generate plugin helptags
for p in glob('$HOME/.vim/pack/default/start/**/doc/', 1, 1)
  exe 'helptags ' . p
endfor

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
" Editing config ======================================================= {{{

" Open config files in right split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Open a right split with ~/.vim in netrw
nnoremap <leader>ee :Vexplore! ~/.vim<cr>

" Globally reload vimrc settings
nnoremap <leader>sv :source $MYVIMRC<cr>

" Globally reload vimrc settings after closing the buffer
" (when editing is complete)
augroup EditingVimrc
  au!
  au BufWinLeave vimrc source $MYVIMRC
augroup end

" ====================================================================== }}}
" ######################################################################

" EDITING ENVIRONMENT ##################################################
" Fonts and colors ===================================================== {{{

if has("gui_running")

  " Hide the toolbar
  set guioptions-=T

  " Hide the left scrollbar
  set guioptions=r

  " Set font
  set guifont=Recursive\ Mono\ Strict:h14

  " Increase leading
  set linespace=4

  " Enable syntax coloring
  syntax enable

  " Set the colorscheme
  colorscheme base16-ocean
  set background=dark

endif

" ====================================================================== }}}
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
nnoremap <c-d> :vert bo help<space>

" Maximize the window
nnoremap <c-m> :set columns=1000<cr>:set lines=1000<cr>

" ====================================================================== }}}
" Line numbering ======================================================= {{{

" Set width of number column
set numberwidth=6

" Default to relative line numbering
set relativenumber

" Toggle relative and absolute numbering
function! ToggleNumber()
  if &relativenumber
    set norelativenumber
    set number
    highlight LineNr gui=bold
  else
    set relativenumber
    set nonumber
    highlight LineNr gui=none
  endif
endfunction

nnoremap <c-r> :call ToggleNumber()<cr>

" ====================================================================== }}}
" Cursors ============================================================== {{{

" Only show the cursorline in the current window
set cursorline
augroup cursorline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
augroup END

" Set width of color column
let g:mycolorcolumn=80

" Toggle an indicator of the wrapping column
function! ToggleColorColumn()
  if &colorcolumn
    set colorcolumn=
  else
    let &colorcolumn=g:mycolorcolumn
  end
endfunction

nnoremap <c-q> :call ToggleColorColumn()<cr>

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

" Use tab to jump between matching braces
nnoremap <tab> %
vnoremap <tab> %

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

  let nucolwidth = &fdc + &number * &numberwidth
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
" Inserting ============================================================ {{{

" Insert a blank line below and exit editing
" expansion: m`1o<esc>``
nnoremap <expr> ,o 'm`' . v:count1 . 'o<esc>``'
nnoremap <expr> ,O 'm`' . v:count1 . 'O<esc>``'

" ====================================================================== }}}
" Deleting ============================================================= {{{

" Delete character to right of cursor
inoremap <s-bs> <esc>lcl

" Clear trailing whitespace
nnoremap <leader>tw :%s/\s\+$//<cr>:noh<cr>

" ====================================================================== }}}
" Moving =============================================================== {{{

" Move lines using leader-j,k
nnoremap <leader>j :m+<cr>==
nnoremap <leader>k :m-2<cr>==
vnoremap <leader>j :m'>+<cr>gv=gv
vnoremap <leader>k :m-2<cr>gv=gv

" ====================================================================== }}}
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
nnoremap <leader>q m`gggqG``

" ====================================================================== }}}
" ######################################################################

" vim: set fdm=marker fdl=0 :
