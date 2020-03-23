" move between splits
nnoremap <m-h> <c-w>h
nnoremap <m-j> <c-w>j
nnoremap <m-k> <c-w>k
nnoremap <m-l> <c-w>l

" open new empty splits in the specified direction
nnoremap <m-H> :leftabove  vnew<cr>
nnoremap <m-J> :rightbelow new<cr>
nnoremap <m-K> :leftabove  new<cr>
nnoremap <m-L> :rightbelow vnew<cr>

" open new split at the far right
nnoremap <m-:> :bo vnew<cr>

" try to maximize the GUI window
nnoremap <m-m> :set columns=1000<cr>:set lines=1000<cr>
