" ==================================================
" Setup grep shortcuts and use ripgrep if available
" ==================================================

nmap g/ :grep!<space>
nmap g* :grep! -w <C-R><C-W><space>
nmap ga :grepadd!<space>
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Auto open grep quickfix window
autocmd QuickFixCmdPost *grep* cwindow

" Search from the git repo root, if we're in a repo, else the cwd
function FuzzyFind(show_hidden)
  " Contains a null-byte that is stripped.
  let gitparent=system('git rev-parse --show-toplevel')[:-2]
  if a:show_hidden
    let $FZF_DEFAULT_COMMAND = g:fzf_default_command . ' --hidden'
  else
    let $FZF_DEFAULT_COMMAND = g:fzf_default_command
  endif
  if empty(matchstr(gitparent, '^fatal:.*'))
    silent execute ':FZF -m ' . gitparent
  else
    silent execute ':FZF -m .'
  endif
endfunction

nnoremap <c-p> :call FuzzyFind(0)<cr>
nnoremap <c-i> :call FuzzyFind(1)<cr>

" Use rg to perform the search, so that .gitignore files and the like are
" respected
let g:fzf_default_command = 'rg --files'


" vim:set et sw=2:
