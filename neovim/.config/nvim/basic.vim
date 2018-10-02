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

" ==================================================
" Basic Settings
" ==================================================
let mapleader="\<Space>" " Change the leader to be a space
set cmdheight=2          " Make command line two lines high
set scrolloff=7          " Set 7 lines to the cursor - when moving vertically using j/k
set sidescrolloff=5      " Have some context around the current line always on screen
set cursorline           " Have a line indicate the cursor location (slow)
set autoindent           " Always set autoindenting on
set smartindent          " Set smart indent
set showcmd              " Display incomplete commands
set ruler                " Show the cursor position all the time
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set number norelativenumber  " Show line numbers
set ttyfast              " Smoother changes
set modeline             " Last lines in document sets vim mode
set shortmess=atIc       " Abbreviate messages
set nostartofline        " Don't jump to first character when paging
set backspace=indent,eol,start
set matchpairs+=<:>      " Show matching <> (html mainly) as well
set showmatch            " Show matching brackets when text indicator is over them
set matchtime=3          " How many tenths of a second to blink when matching brackets
set showmatch                   " Show matching braces, somewhat annoying...
set history=1000         " Sets how many lines of history VIM has to remember
set showmode             " Show the default mode text (e.g. -- INSERT -- below the statusline)
set timeout ttimeoutlen=50
set updatetime=300       " Smaller updatetime for CursorHold & CursorHoldI
set signcolumn=yes

set whichwrap+=<,>,h,l,[,]
set fileformats=unix,dos,mac
set encoding=utf-8
set completeopt=longest,menuone " Preview mode causes flickering
set clipboard+=unnamedplus " Share the system clipboard

set splitright           " Splits to the right
autocmd VimResized * wincmd =   " Automatically equalize splits when Vim is resized

set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set completeopt=menu            " Just show the menu upon completion (faster)

syntax on
set synmaxcol=200        " Syntax highlight only the first 200 chars"
filetype plugin on
filetype indent plugin on

set colorcolumn=80
"set colorcolumn=125 " Comfortable _and_ Github's line length

if has('linebreak')      " Break indent wrapped lines
  set breakindent
  let &showbreak = '↳ '
  set cpo+=n
end

" Linebreak on 500 characters
set lbr
set tw=80


" ==================================================
" Turn persistent undo on means that you can undo
" even when you close a buffer/VIM
" ==================================================
set directory=~/.nvim_runtime/temp_dirs/swap/
set backupdir=~/.nvim_runtime/temp_dirs/backup/
try
  set undodir=~/.nvim_runtime/temp_dirs/undodir
  set undofile
catch
endtry


" ==================================================
" Status line
" ==================================================
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction


" ==================================================
" Use terminal title as an output
" ==================================================
set title
set titleold="Terminal"
set titlestring=%F


" ==================================================
" No annoying sound on errors
" ==================================================
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif


" ==================================================
" Tab expanded to 8 spaces
" ==================================================
set tabstop=8        " numbers of spaces of tab character
set shiftwidth=8     " numbers of spaces to (auto)indent
set expandtab		     " Tab to spaces by default
set softtabstop=8
set smarttab         " Be smart when using tabs ;)


" ==================================================
" Search settings
" ==================================================
set hlsearch             " highlight searches
set incsearch            " do incremental searching
set ignorecase           " ignore case when searching
set infercase            " smarter completions that will be case aware when ignorecase is on
set smartcase            " if searching and search contains upper case, make case sensitive search
set list listchars=trail:»,tab:»-
set fillchars+=vert:\


" ==================================================
" No modelines for security
" ==================================================
set modelines=0
set nomodeline


" ==================================================
" Trailing whitespace handling
" ==================================================

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/


" ==================================================
" Further settings
" ==================================================

" Try to display very long lines, rather than showing @
set display+=lastline

" show trailing whitespace as -, tabs as >-
set listchars=tab:>-,trail:-
set list

" Live substitution
set inccommand=split

if has("nvim")
  set laststatus=1
endif

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround

" number of undo saved in memory
set undolevels=10000 " How many undos
set undoreload=10000 " number of lines to save for undo

" set list
set list listchars=tab:\┆\ ,trail:·,nbsp:±

" doesn't prompt a warning when opening a file and the current file was written but not saved
set hidden

" no swap file! This is just annoying
set noswapfile

" Fold related
set foldlevelstart=0 " Start with all folds closed

" Set foldtext
set foldtext=general#FoldText()

" Show the substitution LIVE
set inccommand=nosplit

" for vertical pane in git diff tool
set diffopt+=vertical

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set to auto read when a file is changed from the outside
set autoread

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" vim:set et sw=2:
" ==================================================
" Color scheme and fonts
" ==================================================
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:material_theme_style = 'palenight'

" disable the mouse - who needs a mouse??
set mouse-=a
set guicursor=

" Set font according to system
if has("mac") || has("macunix")
  set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
  set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
  set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
  set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
  set gfn=Monospace\ 11
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set background=dark
"colorscheme material
set t_Co=256
colorscheme desert
hi Conceal guifg=#81A1C1 guibg=NONE ctermbg=NONE
let g:palenight_terminal_italics=1
let g:material_terminal_italics = 1

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  " Opaque Background (Comment out to use terminal's profile)
  set termguicolors
endif

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" Transparent Background (For i3 and compton)
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE

"" This will repair colors in Tmux.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"" Tmuxline
let g:tmuxline_theme = 'vim_statusline_3'
let g:tmuxline_preset = 'tmux'

"" Bufferline
let g:bufferline_echo = 0 " This will keep your messages from getting quickly hidden.


" vim:set et sw=2:
" ==================================================
" Basic Mappings
" ==================================================

" Maps for jj to act as Esc in insert and command modes
ino jj <esc>
cno jj <c-c>

" One can map ctrl-c to something else if needed
map <c-c> <Nop>
imap <c-c> <Nop>

" Smarter j/k navigation
" Convert the j and k movement commands from strict linewise movements to
" onscreen display line movements via the gj and gk commands. When
" preceded with a count we want to go back to strict linewise movements.
" will automatically save movements larger than 5 lines to the jumplist.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Center next/previous matched string
nnoremap n nzz
nnoremap N Nzz

" Save session
exec 'nnoremap <Leader>ss :mksession! ~/.nvim_runtime/sessions/*.vim<C-D><BS><BS><BS><BS><BS>'
" Reload session
exec 'nnoremap <Leader>sl :so ~/.nvim_runtime/sessions/*.vim<C-D><BS><BS><BS><BS><BS>'

" quick make
map <F6> :make<CR>

" simple pasting from the system clipboard
" http://tilvim.com/2014/03/18/a-better-paste.html
map <Leader>p :set paste<CR>o<esc>"+]p:set nopaste<cr>

" Quickly save, quit, or save-and-quit
map <leader>w :w<CR>
map <leader>x :x<CR>
map <leader>q :q<CR>

" un-highlight when esc is pressed
map <silent><esc> :noh<cr>


" Quickly toggle relative line numbers
function ToggleRelativeLineNumbers()
  set invnumber
  set invrelativenumber
endfunction
nnoremap <leader>l :call ToggleRelativeLineNumbers()<cr>
" Toggle between absolute -> relative line number
"nnoremap <C-n> :let [&nu, &rnu] = [&nu, &nu+&rnu==1]<CR>


" Save files as root
cnoremap w!! execute ':w suda://%'

" ==================================================
" vimrc handling
" ==================================================

" ,v loads .vimrc
" ,V reloads .vimrc -- activating changes (needs save)
map <leader>v :sp ~/.config/nvim/init.vim<CR><C-W>_
map <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ==================================================
" Window navigation
" ==================================================

" control + vim direction key to navigate windows
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" control + arrow key to navigate windows
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
noremap <C-Left> <C-W>h
noremap <C-Right> <C-W>l

" close all windows except the current one
nnoremap <leader>wco :only<cr>
nnoremap <leader>wcc :cclose<cr>

" windows creation
" create window on the bottom
nnoremap <leader>wb <c-w>s
" create vertival window
nnoremap <leader>wv <c-w>v

" " arrow keys resize windows
" nnoremap <Left> :vertical resize -10<CR>
" nnoremap <Right> :vertical resize +10<CR>
" nnoremap <Up> :resize -10<CR>
" nnoremap <Down> :resize +10<CR>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" ==================================================
" Splits handling
" ==================================================

" Make these all work in insert mode
imap <C-W> <C-O><C-W>

" - and + to resize horizontal splits
map - <C-W>-
map + <C-W>+

" alt-< or alt-> for vertical splits
map <m-,> <C-W>>
map <m-.> <C-W><

" F2 close current split (window)
noremap <F2> <Esc>:close<CR><Esc>

" Deleter buffer, keep the split (switch to prev buf, delete now prev buf)
nmap <leader>d :b#<bar>bd#<CR>

" ==================================================
" Tab navigation
" ==================================================
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<CR>
nnoremap tn :tabnew<cr>
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>

" move tab to first position
nnoremap tF :tabm 0<CR>
nnoremap tL :tabm<CR>

" Navigate tabs with shift-{h,l}
noremap <S-l> gt
noremap <S-h> gT

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" ==================================================
" Buffer navigation
" ==================================================
nmap <A-Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" ==================================================
" Clean all end of line whitespace with <Leader>S
" ==================================================
":nnoremap <silent><leader>S :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
:nnoremap <silent><leader>S :call TrimWhitespace()<CR>

" ==================================================
" Visual mode related
" ==================================================
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction


" ==================================================
" Editing mappings
" ==================================================
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" ==================================================
" Spell checking
" ==================================================
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" ==================================================
" Other Configurations
" ==================================================

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

noremap <C-p> :Denite buffer file_rec tag<CR>

xmap <leader>a gaip*
nmap <leader>t <C-w>s<C-w>j:terminal<CR>
nmap <leader>vt <C-w>v<C-w>l:terminal<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>j :set filetype=journal<CR>
nmap <leader>l :Limelight!!<CR>
autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>

vmap <F2> !boxes -d stone

" surround by quotes - frequently use cases of vim-surround
map <leader>" ysiw"<cr>
map <leader>' ysiw'<cr>

" Act like D and C
nnoremap Y y$

" indent without kill the selection in vmode
vmap < <gv
vmap > >gv

" remap the annoying u in visual mode
vmap u y

" shortcut to substitute current word under cursor
nnoremap <leader>[ :%s/<c-r><c-w>//g<left><left>

" Change in next bracket
nmap cinb cib

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call general#VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call general#VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" delete character after cursor in insert mode
inoremap <C-d> <Del>

" highlight the line which is longer than the defined margin (120 character)
highlight MaxLineChar ctermbg=red
autocmd FileType php,js,vue,go call matchadd('MaxLineChar', '\%120v', 100)

" open devdocs.io with waterfox and search the word under the cursor
command! -nargs=? DevDocs :call system('type -p open >/dev/null 2>&1 && open https://devdocs.io/#q=<args> || waterfox -url https://devdocs.io/#q=<args>')
autocmd FileType python,ruby,rspec,javascript,go,html,php,eruby,coffee,haml nmap <buffer> <leader>D :exec "DevDocs " . fnameescape(expand('<cword>'))<CR>

" Markdown
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Quit neovim terminal
tnoremap <C-\> <C-\><C-n>

" Open images with feh
autocmd BufEnter *.png,*.jpg,*gif silent! exec "! feh ".expand("%") | :bw

" A |Dict| specifies the matcher for filtering and sorting the completion candidates.
let g:cm_matcher={'module': 'cm_matchers.abbrev_matcher', 'case': 'smartcase'}

" Disable anoying ex mode
nnoremap Q <Nop>

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" vim:set et sw=2:
" ==================================================
" Right-to-Left (Hebrew etc) shortcuts
" ==================================================

" toggle direction mapping
" this is useful for logical-order editing
map <F9>   :set invrl<CR>
" do it when in insert mode as well (and return to insert mode)
imap <F9> <Esc>:set invrl<CR>a

" toggle reverse insertion
" this is useful for visual-order editing
map <F8>   :set invrevins<CR>
" do it when in insert mode as well (and return to insert mode)
imap <F8> <Esc>:set invrevins<CR>a

" vim:set et sw=2:
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
