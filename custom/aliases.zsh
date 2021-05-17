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

if [ -f ~/dotfiles/idea/idea ]; then
    alias idea="~/dotfiles/idea/idea"
fi

if [ -f ~/dotfiles/idea/pycharm ]; then
    alias pycharm="~/dotfiles/idea/pycharm"
fi

if [ -f ~/dotfiles/idea/clion ]; then
    alias clion="~/dotfiles/idea/clion"
fi

# ------ C/C++ ------
alias buildcpp='g++ -std=c++17 -stdlib=libc++'
alias buildc='gcc -std=c18 -o'

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
