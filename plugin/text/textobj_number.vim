function! s:Number()
    let num = '\v[0-9.]'
    normal! viWo
    while getline('.')[col('.') - 1] !~# num
        normal! l
    endwhile
    normal! o
    while getline('.')[col('.') - 1] !~# num
        normal! h
    endwhile
endfunction

onoremap iN :<c-u>call <SID>Number()<cr>
xnoremap iN :<c-u>call <SID>Number()<cr>
onoremap aN :<c-u>call <SID>Number()<cr>
xnoremap aN :<c-u>call <SID>Number()<cr>
