" ===================================================================
" ale (Asynchronous Lint Engine) settings
" ===================================================================

" Syntax / File Support
"" Enable JSDoc syntax highlighting
let g:javascript_plugin_jsdoc = 1

"" Add an error indicator to Ale
let g:ale_sign_column_always = 1

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
        \   '%dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=%{LinterStatus()}

nmap <silent> <leader>e <Plug>(ale_next_wrap)
nmap <silent> <leader>q <Plug>(ale_previous_wrap)

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=0
let g:ale_list_window_size = 5
let g:ale_linters = {'python': ['flake8']}
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \}
" \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
let g:ale_fix_on_save = 1

" Use system flake8
let g:ale_python_flake8_executable = '/usr/bin/flake8'

" Append our Neovim virtualenv to the list of venvs ale searches for
" The search is performed from the buffer directory up, until a name match is
" found; our Neovim venv lives in ~/.nvim-venv
let g:ale_virtualenv_dir_names = ['.env', '.venv', 'env', 'virtualenv', 'venv', '.nvim-venv']
" Explicitly list linters we care about
let g:ale_linters = {'python': ['flake8', 'pylint']}
" Only show warnings and errors from pylint
let g:ale_python_pylint_options = '--disable C,R'
let g:ale_sign_warning = '→'
let g:ale_sign_error = '→'

" PHP Support
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_php_phpcs_standard='phpcs.xml.dist'
let g:ale_php_phpmd_ruleset='phpmd.xml'

" vim:set et sw=2:
