" vimrc ================================================================ {{{
"
" Author: A. Mattson Gallagher <ndrwg@me.com>
" Source: https://github.com/ndrwg/dotvim
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
" Steve Losh  (https://bitbucket.org/sjl/dotfiles
"              http://stevelosh.com/blog/2010/09/coming-home-to-vim/)
" Emily St    (https://github.com/emilyst/home)
"
" ====================================================================== }}}

" FOUNDATION ###########################################################
" Preamble ============================================================= {{{


" Remove vi compatibility
set nocompatible

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
" Plugin system ======================================================== {{{


" Setup Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
if exists("g:loaded_pathogen")
  execute pathogen#infect()
  execute pathogen#helptags()
endif

" Enable filetype plugins
filetype plugin on


" ====================================================================== }}}
" Basic keybindings ==================================================== {{{


" Use semicolon for commands
nnoremap ; :

" Exit insert mode with shift-space
inoremap <s-space> <esc>

" Leaders
let mapleader = ","
let maplocalleader = "\\"

" More intuitive redo command
nnoremap U <c-r>


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
" augroup RememberLastView
"   au!
"   au BufWinLeave * silent! mkview
"   au BufWinEnter * silent! loadview
" augroup end

" viminfo file
set viminfo+=n~/.vim/local/info/viminfo


" ====================================================================== }}}
" Editing vimrc ======================================================== {{{


" Quickly open vimrc
nnoremap <leader>rc :e ~/.vim/vimrc<cr>

" Reload vimrc on save
augroup EditingVimrc
  au!
  au BufWritePost vimrc mkview | source % | loadview
  au BufWinLeave  vimrc silent! mkview
  au BufWinEnter  vimrc silent! loadview
augroup end


" ====================================================================== }}}

" VIEWING AND NAVIGATING TEXT ##########################################
" Motion (within text) ================================================= {{{


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

" Keep matches in the middle of the screen
" nnoremap n nzzzv
" nnoremap N Nzzzv

" Clear search higlights
nnoremap <leader><space> :noh<cr>

" Highlight matching braces
" set showmatch


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
" Moving text ========================================================== {{{


" Move lines using leader-j,k
nnoremap <leader>j :m+<cr>==
nnoremap <leader>k :m-2<cr>==
vnoremap <leader>j :m'>+<cr>gv=gv
vnoremap <leader>k :m-2<cr>gv=gv


" ====================================================================== }}}
" Yanking and pasting ================================================== {{{


" Paste from system clipboard
nnoremap <leader>p "*p

" Yank to system clipboard
nnoremap <leader>y "*y
vnoremap <leader>y "*y

" Reselect pasted text
nnoremap <leader>v V`]


" ====================================================================== }}}
" Wrapping ============================================================= {{{


" Wrap text in breaks (do not split words)
set wrap linebreak
" Default to not wrap text (for code)
set nowrap
" When wrapping, use a width of 80
set textwidth=80

" Wrap a paragraph
nnoremap Q gqip
vnoremap Q gq

" Wrap an entire file
nnoremap <leader>q mqgggqG`q

" Toggle an indicator of the wrapping column
function! ToggleColorColumn()
  if &colorcolumn
    set colorcolumn=
  else
    let &colorcolumn = &textwidth + 1
  end
endfunction
nnoremap <c-q> :call ToggleColorColumn()<cr>



" ====================================================================== }}}
" Code completion ====================================================== {{{


" Close HTML tag
inoremap <c-d-.> </<c-x><c-o>


" ====================================================================== }}}

" GRAPHICAL VIM ########################################################
" Fonts and colors ===================================================== {{{


" Highlight current line
set cursorline

" Turn on line numbering
set number
set numberwidth=6

" Toggle relative and absolute numbering
nnoremap <c-n> :set relativenumber!<cr>

if has("gui_running")

  " Hide the toolbar
  set guioptions-=T
  " Hide the left scrollbar
  set guioptions=r

  " Set font
  set guifont=IBM\ Plex\ Mono:h14
  " Increase leading
  set linespace=4

  " Enable syntax coloring
  syntax enable
  " Set the colorscheme
  colorscheme base16-ocean
  set background=dark

endif


" ====================================================================== }}}
" Split window management ============================================== {{{


" Move between splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Add the same directions for the terminal
tnoremap <c-h> <c-w>h
tnoremap <c-j> <c-w>j
tnoremap <c-k> <c-w>k
tnoremap <c-l> <c-w>l

" Open new empty splits in the specified direction
nnoremap <s-h> :leftabove vnew<cr>
nnoremap <s-j> :rightbelow new<cr>
nnoremap <s-k> :leftabove new<cr>
nnoremap <s-l> :rightbelow vnew<cr>

" Quickly open help files in right vsplit
nnoremap <c-a> :vert bo help 

" Make window narrow for editing prose/markdown
" (Can't use alt/meta as a modifier on OS X, since it sends a
" special character instead, so use that character instead.)
nnoremap “ :set columns=90<cr>

" Restore full width window
nnoremap ‘ :set columns=1000<cr>


" ====================================================================== }}}

" vim: set fdm=marker :
