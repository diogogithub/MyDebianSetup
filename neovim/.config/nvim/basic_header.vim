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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> Settings (01-settings)
"    -> Theme (02-theme)
"    -> Keymap (10-keymap-general, 11-keymap-rtl)
"    -> File type specific (31-file-type.vim)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

