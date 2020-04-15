" generates helptags for packages/plugins
" (replacement for Pathogen)
for p in glob('$HOME/.vim/pack/default/start/**/doc/', 1, 1)
    exe 'helptags ' . p
endfor
