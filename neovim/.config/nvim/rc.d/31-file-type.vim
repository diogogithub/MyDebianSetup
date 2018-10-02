" ===================================================================
" FileType and Indentation settings
"
" Recommended: Don't rely on this, use editorconfig " in your project
" ===================================================================

" define less filetype
au BufNewFile,BufRead *.less set filetype=less

" make the smarty .tpl files html files for our purposes
au BufNewFile,BufRead *.tpl set filetype=html

" json
au! BufRead,BufNewFile *.json set filetype=json

" jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype xhtml setlocal ts=2 sw=2 expandtab
autocmd Filetype xml setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype less setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype python setlocal omnifunc=jedi#completions tw=79
      \ completeopt-=preview
      \ formatoptions+=c


" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" LaTeX
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Always assume .tex files are LaTeX
let g:tex_flavor = "latex"

" Don't autocomplete filenames that match these patterns
" Version control
set wildignore=.svn,.git
" Compiled formats
set wildignore+=*.o,*.pyc
" Images
set wildignore+=*.jpg,*.png,*.pdf
" Auxilary LaTeX files
set wildignore+=*.aux,*.bbl,*.blg,*.out,*.toc
" Web development
set wildignore+=vendor,_site,tmp,node_modules,bower_components
" Script outputs
set wildignore+=output

au BufNewFile,BufRead ~/.mutt/tmp/neomutt-* setlocal filetype=mail

" Makefiles require actual tabs
au FileType make setlocal noexpandtab

" Don't create backup files when editing crontabs
au filetype crontab setlocal nobackup nowritebackup

" Python style uses 4 spaces as tabs
au FileType python setlocal tabstop=4 shiftwidth=4

au BufNewFile,BufRead *.md setlocal filetype=markdown syntax=markdown
au BufNewFile,BufRead *.markdown setlocal syntax=markdown

" Spellchecking in LaTeX, Markdown
au FileType tex,plaintex,markdown setlocal spelllang=en_gb spell formatoptions=tcroqlj

" Wrap Python automatically at 80 characters
au FileType python setlocal textwidth=79 formatoptions=tcroqlj

" relativenumber can be very slow when combined with a language whose syntax
" highlighting regexs are complex
" https://github.com/neovim/neovim/issues/2401
" https://groups.google.com/forum/#!topic/vim_use/ebRiypE2Xuw
au FileType tex set norelativenumber

" Enable marker folder for Beancount files
au FileType beancount set foldmethod=marker foldlevel=0 foldlevelstart=0

" I often type `#` to start a comment, as alt-3, then hit space
" alt-space is a UTF non-breaking space character, which can give encoding errors
highlight UTFSpaceComment ctermfg=White ctermbg=1
au BufNewFile,BufRead * :syn match UTFSpaceComment '.\%uA0'

augroup mail
  au!

  au FileType mail setlocal spell spelllang=en_gb

  " Common standard used in plaintext emails
  au FileType mail setlocal textwidth=72

  " w: Lines ending with spaces continue on the next line, used in combination
  "    with Mutt's text_flowed option
  " a: Format automatically
  " t: Wrap using textwidth
  " c: Wrap comments using textwidth
  " q: Format with gq macro
  au FileType mail setlocal formatoptions=watcq

  " Define comment leaders as in a Markdown document, that is:
  " * Treat *, -, +, and > as comment leaders
  " * Characters *, -, + begin comments when followed by a space, and wrapped
  "   lines immediately after these should be indented
  " * Comments starting with > can be nested
  au FileType mail setlocal comments=fb:*,fb:-,fb:+,n:>

  " Install an autogroup that triggers when inside a `mail.*` syntax group
  au FileType mail call OnSyntaxChange#Install('NoWrapElements', '^mail', 1, 'a')

  " Use the trigger to disable/enable text wrapping when leaving/enter the
  " mail body (i.e. we only want wrapping in the mail body).
  au FileType mail autocmd User SyntaxNoWrapElementsEnterA setlocal formatoptions-=watc
  au FileType mail autocmd User SyntaxNoWrapElementsLeaveA setlocal formatoptions+=watc
augroup end

" Twig
autocmd BufNewFile,BufRead *.twig set filetype=html.twig

" PHP
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
map <c-s> <esc>:w<cr>:Silent php-cs-fixer fix %:p --level=symfony<cr>

" vim:set et sw=2:
