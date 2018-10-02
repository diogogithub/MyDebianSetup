" ===================================================================
" Deoplete
" ===================================================================

" Autocomplete
call deoplete#custom#option('sources', {'php' : ['omni', 'phpactor', 'ultisnips', 'buffer']})
let g:deoplete#enable_at_startup = 1

" disable autocomplete
let g:deoplete#disable_auto_complete = 1
if has("gui_running")
  inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
else
  inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
endif

" deoplete + neosnippet + autopairs changes
let g:AutoPairsMapCR=0
call deoplete#custom#option('auto_complete_start_length', 1)
call deoplete#custom#option('enable_at_startup', 1)
call deoplete#custom#option('enable_smart_case', 1)

"" Deoplete per-autocompleter settings

""" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete

""" Omnifunctions
call deoplete#custom#var('omni', 'functions', {
\ 'java' : 'eclim#java#complete#CodeComplete',
\ 'javascript' : [
      \ 'tern#Complete',
      \ 'autocomplete_flow#Complete',
      \ 'javascriptcomplete#CompleteJS'
      \],
\ 'css' : ['csscomplete#CompleteCSS'],
\ 'html' : [
      \ 'htmlcomplete#CompleteTags',
      \ 'xmlcomplete#CompleteTags'
      \],
\ 'xml' : ['xmlcomplete#CompleteTags'],
\ 'perl' : ['perlomni#PerlComplete'],
\})

let g:EclimCompletionMethod = 'omnifunc'

" vim:set et sw=2:
