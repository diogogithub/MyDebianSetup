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
