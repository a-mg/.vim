" move between splits
nnoremap <m-h> <c-w>h
nnoremap <m-j> <c-w>j
nnoremap <m-k> <c-w>k
nnoremap <m-l> <c-w>l

" move between splits in terminal
" (meta is sending special characters)
tnoremap è <c-w>h
tnoremap ê <c-w>j
tnoremap ë <c-w>k
tnoremap ì <c-w>l

" open new empty splits in the specified direction
nnoremap <m-H> :leftabove  vnew<cr>
nnoremap <m-J> :rightbelow new<cr>
nnoremap <m-K> :leftabove  new<cr>
nnoremap <m-L> :rightbelow vnew<cr>

" open new split at the far right
nnoremap <m-:> :bo vnew<cr>

" open new terminal at the far right
nnoremap <m-T> :vert bo term<cr>

" try to maximize the GUI window
nnoremap <m-m> :set columns=1000<cr>:set lines=1000<cr>

" open help/docs at the far right
nnoremap <m-?> :vert bo help<space>

" open vim config folder
nnoremap <m-v> :Explore   ~/.vim<cr>
nnoremap <m-V> :Vexplore! ~/.vim<cr>
