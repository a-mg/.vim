set noshowmode                                 " hide the mode
set showcmd                                    " show partial commands
set laststatus=2                               " always show statusline

let statusline_text =
            \  "%#StatusLinePath# %f "
            \. "%#StatusLineModified#"
            \. "%{&modified ? ' * ' : ''}"
            \. "%#StatusLine#  "
            \. "%{SLGit()}  "
            \. "%="
            \. "%{SLCount()}"
            \. "%{&filetype != '' ? &filetype . ' | ' : ''}"
            \. "%{&fileencoding ? &fileencoding : &encoding} | "
            \. "%{&expandtab ? '␣' . &shiftwidth : '→'}"
            \. "%12(%l/%L,%c%) "

let statusline_text_nc =
            \  " %f "
            \. "%#StatusLineNCModified#"
            \. "%{&modified ? ' * ' : ''}"
            \. "%#StatusLineNC"

let statusline_ui =
            \  "%#StatusLine#"
            \. "%#StatusLinePath# %{&filetype != '' ? &filetype : &buftype} "
            \. "%#StatusLine# %F"

let statusline_ui_nc =
            \  "%#StatusLineNC# %{&filetype != '' ? &filetype : &buftype}: %F"



function! SLGit() abort
    let branch    = FugitiveStatusline()->matchstr("(\\zs.*\\ze)")
    let [a, m, r] = GitGutterGetHunkSummary()
    return (branch !=? "")
                \? printf("%s: +%d,~%d,-%d", branch, a, m, r)
                \: ""
endfunction

function! SLCount() abort
    return (index(["text", "markdown"], &filetype) != -1)
                \? wordcount().words . " words | "
                \: ""
endfunction



function! SetStatusLine(filetype, on_off) abort
    execute "setlocal statusline=%!"
                \. "statusline_"
                \. (index(["fugitive", "gitcommit", "netrw", "help"], a:filetype) > -1
                \   || &buftype == "terminal"
                \       ? "ui"
                \       : "text")
                \. (a:on_off == 0
                \       ? "_nc"
                \       : "")
endfunction

augroup Statusline
    autocmd!
    autocmd WinEnter,BufEnter,FileType,TerminalOpen * call SetStatusLine(&filetype, 1)
    autocmd WinLeave,BufLeave                       * call SetStatusLine(&filetype, 0)
augroup END
