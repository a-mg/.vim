" vimrc ================================================================ {{{
"
"
"
" Author: A. Mattson Gallagher <ndrwg@me.com>
" Source: https://github.com/ndrwg/dotvim
"
" This file contains settings and configuration for the vim editor.
" Only core settings and mappings are included here; any settings
" related to plugins or languages live in other files.
"
" Currently (2018-08-03) using MacVim.
"
" Thanks to:
" Steve Losh (https://bitbucket.org/sjl/dotfiles/src/default/vim/vimrc)
" Emily St (https://github.com/emilyst/home/blob/master/.vimrc)
"
"
"
" ====================================================================== }}}
" Preamble ============================================================= {{{



" Remove vi compatibility
set nocompatible

" Setup Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
if exists("g:loaded_pathogen")
  execute pathogen#infect()
  execute pathogen#helptags()
endif



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
augroup RememberLastView
  au!
  au BufWinLeave * silent! mkview
  au BufWinEnter * silent! loadview
augroup end



" Show partial commands while typing
set showcmd

" Hide the current mode (used for status line replacement)
set noshowmode



" Don't beep constantly
set visualbell



" ====================================================================== }}}
" Basic keybindings ==================================================== {{{



" Use semicolon for commands
nnoremap ; :

" Exit insert mode with shift-space
inoremap <S-Space> <esc>

" Leaders
let mapleader = ","
let maplocalleader = "\\"



" ====================================================================== }}}
" Text editing ========================================================= {{{



" Text encoding
set encoding=utf-8



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



" Paste from system clipboard
nnoremap <leader>p "*p
inoremap <C-v> <esc>"*pa

" Yank to system clipboard
nnoremap <leader>y "*y
vnoremap <leader>y "*y
nnoremap <C-c> "*y
vnoremap <C-c> "*y



" Close HTML tag
inoremap <C-D-.> </<C-X><C-o>



" ====================================================================== }}}
" Searching and motion ================================================= {{{



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



" Move lines using leader-j,k
nnoremap <leader>j :m+<cr>==
nnoremap <leader>k :m-2<cr>==
vnoremap <leader>j :m'>+<cr>gv=gv
vnoremap <leader>k :m-2<cr>gv=gv



" Use tab to jump between matching braces
nnoremap <tab> %
vnoremap <tab> %



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
nnoremap <Space> za
vnoremap <Space> za



" ====================================================================== }}}
" Fonts and colors ===================================================== {{{



" Highlight current line
set cursorline

" Turn on line numbering
set number

" Toggle relative and absolute numbering
nnoremap <C-S-n> :set relativenumber!<cr>



if has("gui_running")

  " Hide the toolbar
  set guioptions-=T

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
" Editing vimrc ======================================================== {{{



" Quickly open vimrc
nnoremap <leader>rc :e ~/.vim/vimrc<cr>

" Reload vimrc on save
autocmd BufWritePost vimrc mkview | source % | loadview



" ====================================================================== }}}
" vim: set fdm=marker :
