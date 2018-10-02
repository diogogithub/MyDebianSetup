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
colorscheme minimalist
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
