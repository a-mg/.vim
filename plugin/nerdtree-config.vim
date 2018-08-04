" Appearance settings
let NERDTreeMinimalUI             = 1
let NERDTreeMouseMode             = 1
let NERDTreeDirArrows             = 1
let g:NERDTreeDirArrowExpandable  = '▷'
let g:NERDTreeDirArrowCollapsible = '▽'
let NERDTreeQuitOnOpen            = 0
let NERDTreeKeepTreeInNewTab      = 1

" File display settings
let g:NERDTreeShowHidden          = 1
let NERDTreeIgnore                = ['.DS_Store', '\.git', '.bash_sessions', '.config', '.cups', 
  \                                  '.dropbox', '.gem', '.local', '.oracle_jre_usage',
  \                                  '.ssh', '.subversion', '.Trash', '.adobe']



" Toggle and find key mappings
noremap  <c-\> :NERDTreeToggle<cr>
inoremap <c-\> <esc>:NERDTreeToggle<cr>
noremap  «     :NERDTreeFind<cr>
inoremap «     <esc>:NERDTreeFind<cr>
