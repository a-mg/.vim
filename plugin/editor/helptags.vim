" generates helptags for packages/plugins
" (replacement for Pathogen)
for p in glob('$HOME/.vim/pack/default/start/**/doc/', 1, 1)
    try
        exe 'helptags ' . p
    catch
        " do nothing on error
    endtry
endfor
