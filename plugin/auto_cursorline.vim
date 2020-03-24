" only show the cursorline in the active window
set cursorline
augroup CursorLine
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
augroup END
