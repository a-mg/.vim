" only show the cursorline in the active window
set cursorline
augroup cursorline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
augroup END
