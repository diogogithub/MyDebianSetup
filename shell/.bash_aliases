# enable color support of ls and other commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -F'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# better less
alias less="less -R "

alias php="php -c ~/workspace/php.ini"
alias ..="cd .."

# Alternative system beep for (not only) when the system has no internal beep
export BEEP=/usr/share/sounds/freedesktop/stereo/bell.oga
alias beep='paplay $BEEP --volume=32768'

alias  vi=$(which vim)

### Extra aliases added after default:

# Cheat code indent
stylefix ()
{
        for file in $@
        do
                indent -linux -l80 -nbad -bap -bc -bbo -bl -bli0 -bls -ncdb -nce -cp1 -c33 -cs -di2 -ndj -nfc1 -nfca -hnl -i8 -ip5 -lp -pcs -psl -nsc -nsob -nut "$PWD/$file"
                rm "$PWD/$file~"
        done
}
alias stylefix=stylefix;
alias pkgin='sudo aptitude install'
alias pkgrm='sudo aptitude remove'
alias wttr='curl http://wttr.in/Porto,Portugal'
