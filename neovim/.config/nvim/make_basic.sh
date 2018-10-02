#!/bin/zsh
cat basic_header.vim rc.d/{01-settings,02-theme,10-keymap-general,11-keymap-rtl,31-file-type}.vim > basic.vim
sed -i 's/colorscheme minimalist/colorscheme desert/g' basic.vim
