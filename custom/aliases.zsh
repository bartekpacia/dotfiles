# ------ General ------
alias cls="clear"

if command -v lsd &>/dev/null; then
    alias lsd="lsd -lah"
else
    alias lsd="ls -lah"
fi

if command -v bat &>/dev/null; then
    alias cat="bat -p"
fi

# ------ Dev ------
godev() {
    cd ~/dev/go
}

nodev() {
    cd ~/dev/node
}

pydev() {
    cd ~/dev/python
}

# ------ Sleep ------

if command -v pmset &>/dev/null; then
    alias zzz="pmset sleepnow"
    alias zzzz="pmset sleepnow"
    elif command -v systemctl &>/dev/null; then
    alias zzz="systemctl sleep"
    alias zzzz="systemctl sleep"
fi

# ------ IntelliJ IDEs ------

if [ -f ~/dotfiles/local/idea ]; then
    alias idea="~/dotfiles/local/idea"
fi

if [ -f ~/dotfiles/local/pycharm ]; then
    alias pycharm="~/dotfiles/local/pycharm"
fi

if [ -f ~/dotfiles/local/clion ]; then
    alias clion="~/dotfiles/local/clion"
fi

# ------ Shit ------

lenny() {
    if [ "$1" = "sad" ]; then
        printf "( ͡° ʖ̯ ͡°)\n"
        elif [ "$1" = "sly" ]; then
        printf "( ͡° ͜ʖ ͡°)\n"
        elif [ "$1" = "idk" ]; then
        printf "¯\_(ツ)_/¯\n"
    else
        printf "error: name the lenny!\n"
    fi
}
