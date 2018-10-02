" ==================================================
" CtrlP
" ==================================================

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
      \ "dir": '\v[\/]\.(git|hg|svn)$',
      \ "file": '\v\.(exe|so|dll|jpeg|jpg|png|gif)'
      \ }
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:30'

" ==================================================
" gr opens Fuzzy tags search
" ==================================================
nmap gr :CtrlPBufTag<CR>
let g:ctrlp_buftag_types = {
      \ 'go' : '--language-force=go --golang-types=ftv',
      \ 'coffee' : '--language-force=coffee --coffee-types=cmfvf',
      \ 'markdown' : '--language-force=markdown --markdown-types=hik',
      \ 'objc' : '--language-force=objc --objc-types=mpci',
      \ 'rc' : '--language-force=rust --rust-types=fTm'
      \ }

" ==================================================
" Use ag for ctrlp if available
" ==================================================
if executable('ag')
  map <leader>f :Ag<Space>
  " Use Ag over Grep
  set grepprg="ag -i --nogroup --nocolor"

  " Use Ag over Ack
  let g:ackprg='ag -i --nogroup --nocolor --column'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command='ag -i %s -l --nocolor -g ""'
endif

" ==================================================
" Use ripgrep for ctrlp if available
" ==================================================
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" vim:set et sw=2:
