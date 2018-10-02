" ==================================================
" COC configuration and mapping
" ==================================================

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Coc extensions
let g:coc_global_extensions = [
      \ 'coc-emoji',
      \ 'coc-diagnostic',
      \ 'coc-pairs',
      \ 'coc-ultisnips',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-tsserver',
      \ 'coc-vimtex',
      \ 'coc-yaml',
      \ 'coc-json',
      \]

" \ 'coc-highlight',
" \ 'coc-dictionary',
" \ 'coc-syntax',

" outliner
let g:vista_default_executive = 'coc'
let g:vista#renderer#enable_icon = 0
" nnoremap <leader>o :Vista!!<CR>

" Coc Pairs
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd FileType tex let b:coc_pairs = [["$", "$"]]
autocmd FileType markdown let b:coc_pairs_disabled = ['`']

" vim:set et sw=2:
