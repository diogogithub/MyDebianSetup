" ==================================================
" Tagbar Mapping
" ==================================================

nmap <F5> :TagbarToggle<CR>

let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']
let g:tagbar_autofocus = 1

let g:tagbar_type_go = {
                  \ 'ctagstype' : 'go',
                  \ 'kinds'   : ['p:package', 'i:imports:1', 'c:constants', 'v:variables', 't:types', 'n:interfaces', 'w:fields', 'e:embedded', 'm:methods', 'r:constructor', 'f:functions'],
                  \ 'sro' : '.',
                  \ 'kind2scope' : {'t' : 'ctype', 'n' : 'ntype'},
                  \ 'scope2kind' : {'ctype' : 't', 'ntype' : 'n'},
                  \ 'ctagsbin'  : 'gotags',
                  \ 'ctagsargs' : '-sort -silent'
                  \ }

let g:tagbar_type_rust = {
                  \ 'ctagstype' : 'rust',
                  \ 'kinds' : [
                  \'T:types,type definitions',
                  \'f:functions,function definitions',
                  \'g:enum,enumeration names',
                  \'s:structure names',
                  \'m:modules,module names',
                  \'c:consts,static constants',
                  \'t:traits',
                  \'i:impls,trait implementations',
                  \]
                  \}

" PHP Support
let g:tagbar_phpctags_bin='~/.local/bin/phpctags'

" vim:set et sw=2:
