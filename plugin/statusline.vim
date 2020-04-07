set noshowmode                                 " hide the mode
set showcmd                                    " show partial commands
set laststatus=2                               " always show statusline

let statusline_on   = ""
let statusline_on  .= "%#StatusLinePath#"
let statusline_on  .= " %f "                   " path (relative to pwd)
let statusline_on  .= "%#StatusLineOnModified#"
let statusline_on  .= "%{SLMod()}"             " modified
let statusline_on  .= "%#StatusLine#"
let statusline_on  .= " "
let statusline_on  .= "%{SLGit()}"             " git status
let statusline_on  .= "%="                     " right align
let statusline_on  .= "%{SLCount()}"           " word count
let statusline_on  .= "%y"                     " filetype
let statusline_on  .= "%{SLEnc()}"             " encoding
let statusline_on  .= " "
let statusline_on  .= "%12("                   " ruler group:
let statusline_on  .= "%l"                     " current line
let statusline_on  .= "/%L"                    " total lines
let statusline_on  .= ",%c"                    " current column
let statusline_on  .= "%)"
let statusline_on  .= " "

let statusline_off  = " "
let statusline_off .= "%f"                     " path (relative to pwd)
let statusline_off .= "%#StatusLineOffModified#"
let statusline_off .= "%{SLMod()}"             " modified
let statusline_off .= "%#StatusLineNC#"

let statusline_ui   = ""
let statusline_ui  .= "%#StatusLinePath#"
let statusline_ui  .= " %y "                   " filetype
let statusline_ui  .= "%#StatusLine#"



function! SLEnc() abort
  return "[" . (&fileencoding ? &fileencoding : &encoding) . "]"
endfunction

function! SLGit() abort
  let branch = FugitiveStatusline()
  if branch ==? ""
    return ""
  else
    let git = "[" . matchstr(branch, "(\\zs.*\\ze)") . "]"
    let [a, m, r] = GitGutterGetHunkSummary()
    let git .= printf('[+%d,~%d,-%d]', a, m, r)
    return git
  endif
endfunction

function! SLMod() abort
  if &modified
    return " * "
  else
    return ""
  endif
endfunction

function! SLCount() abort
  if index(["text", "markdown"], &filetype) != -1
    return "[" . wordcount().words . " words]"
  else
    " don't count words in code
    return ""
  endif
endfunction



let s:ignore = ["fugitive", "netrw"]
augroup Statusline
  autocmd!
  autocmd WinEnter,BufEnter *
        \ if index(s:ignore, &ft) < 0
        \ | setlocal statusline=%!statusline_on
        \ | endif
  autocmd WinLeave,BufLeave * setlocal statusline=%!statusline_off
  autocmd FileType netrw,fugitive setlocal statusline=%!statusline_ui
augroup END
