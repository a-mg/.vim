" Insert with Lexima disabled until leaving insert mode
function LeximaDisableWhileInsert()
  let b:lexima_disabled = 1
  augroup LeximaEnable
    au!
    au InsertLeave <buffer> call LeximaEnable()
  augroup END
endfunction

function LeximaEnable()
  let b:lexima_disabled = 0
  augroup LeximaEnable
    au!
  augroup END
endfunction

nnoremap <silent> <leader>i :call LeximaDisableWhileInsert()<cr>i

" Match : with ; when writing CSS
call lexima#add_rule({'char': ':', 'input_after': ';', 'filetype': 'css'})
call lexima#add_rule({'char': ';', 'at': '\%#\;', 'leave': 1, 'filetype': 'css'})
call lexima#add_rule({'char': '<BS>', 'at': '\:\%#\;', 'delete': 1, 'filetype': 'css'})
