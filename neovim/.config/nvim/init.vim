" As recommended by `:help provider`, define a venv just for neovim that has
" the neovim module and some Python linters
let g:python3_host_prog = expand('~/.config/nvim/env/bin/python')

" Enable nocompatible
if has('vim_starting')
  " set default encoding to utf-8
  " Let Vim use utf-8 internally, because many scripts require this
  exe 'set encoding=utf-8'
  scriptencoding utf-8
  if &compatible
    set nocompatible
  endif
  " python host
  if !empty($PYTHON_HOST_PROG)
    let g:python_host_prog  = $PYTHON_HOST_PROG
  endif
  if !empty($PYTHON3_HOST_PROG)
    let g:python3_host_prog = $PYTHON3_HOST_PROG
  endif
endif

" ==================================================
" Allow pre-definitions via ~/.config/nvim/before.vim
" ==================================================
if filereadable(expand("~/.config/nvim/before.vim"))
  source ~/.config/nvim/before.vim
endif

" ==================================================
" Source the files ~/.config/nvim/rc.d/
" ==================================================
for f in split(glob('~/.config/nvim/rc.d/*.vim'), '\n')
  exe 'source' f
endfor

" ==================================================
" Allow overrides via ~/.config/nvim/after.vim
" ==================================================
if filereadable(expand("~/.config/nvim/after.vim"))
  source ~/.config/nvim/after.vim
endif

" vim:set et sw=2:
