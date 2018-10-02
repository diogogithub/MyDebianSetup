#!/bin/bash

# This script is called by i3 on startup.

# maps caps lock to escape for vim (and ctrl)
setxkbmap -option 'caps:ctrl_modifier' && xcape -e 'Caps_Lock=Escape' &

xmodmap ~/.Xmodmap
