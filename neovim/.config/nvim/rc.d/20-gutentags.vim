" ===================================================================
" Gutentags
" ===================================================================

" Jump to definition (if anyone knows how to make this work properly...)
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_project_root = ['.root', '.git']
let g:gutentags_plus_switch = 1
map <silent> <F12> :CtrlPTag<cr><c-\>w

" vim:set et sw=2:
