" Fugitive configuration is in two places:
"   ~/.vim/plugin/config/fugitive.vim
"   ~/.vim/ftplugin/fugitive.vim
"
" this file: *internal* configuration for the fugitive filetype
" (settings/mappings which apply only in the Fugitive window)

" push commits
nnoremap <silent><buffer> S :Git push<cr>
