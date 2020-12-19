# Projects
alias rudy_android='cd ~/dev/android/discover-rudy-android'
alias rudy_functions='cd ~/dev/node/discover-rudy-functions'
alias buildcpp='clang++ -std=c++17 -stdlib=libc++ -o program'
alias buildc='clang -std=c18 -o program'

alias cls="clear"

if command -v lsd &>/dev/null; then
  alias lsd="lsd -lah"
else
  alias lsd="ls -lah"
fi

if command -v bat &>/dev/null; then
  alias cat="bat -p"
fi


# ------ Sleep ------
zzz() {
  pmset sleepnow
}

zzzz() {
  pmset sleepnow
}

# ------ Shit ------

lenny() {
  if [ "$1" = "sad" ]; then
    printf "( ͡° ʖ̯ ͡°)\n"
    elif [ "$1" = "sly" ]; then
    printf "( ͡° ͜ʖ ͡°)\n"
  else
    printf "error: name the lenny!\n"
  fi
}

# ------ IntelliJ IDEs ------

if [ -f ~/dotfiles/idea/idea ]; then
  alias idea="~/dotfiles/idea/idea"
fi

if [ -f ~/dotfiles/idea/pycharm ]; then
  alias pycharm="~/dotfiles/idea/pycharm"
fi

# ------ Spotify ------

testvol() {
  saved_volume=$(spotify vol)
  saved_volume=$(echo $saved_volume | perl -pe 's/\x1b\[[0-9;]*[mG]//g')
  printf "saved_volume (stripped): $saved_volume\n"
  
  regex="[0-9][0-9]?[0-9]?"
  if [[ "$saved_volume" =~ $regex ]]; then
    saved_volume=$BASH_REMATCH[1]
    echo "MATCH: $MATCH"
  fi
}

alias s="splay & disown"

# Play song passed as argument
splay() {
  saved_volume=$(spotify vol | perl -pe 's/\x1b\[[0-9;]*[mG]//g')
  
  if [[ "$saved_volume" =~ '[0-9][0-9]?[0-9]?' ]]; then
    saved_volume=$MATCH
  fi
  
  spotify vol 0 >/dev/null
  spotify pause >/dev/null
  song_name="$@"
  
  # Shortcuts for my playlists
  if [[ ! -z $song_name ]]; then
    if [[ "$song_name" == "cali" ]]; then
      echo "Dreaaam of Californicaaation..."
      _splay_california
      elif [[ "$song_name" == "nosten" ]]; then
      echo "Playing English nostalgic playlist..."
      _splay_nostalgia_en
      elif [[ "$song_name" == "nostpl" ]]; then
      echo "Playing Polish nostalgic playlist..."
      _splay_nostalgia_pl
      elif [[ "$song_name" == "lofi" ]]; then
      echo "Just chillin..."
      _splay_lofi
    else
      echo "Searching for \"$song_name\""
      spotify play "$song_name" >/dev/null
    fi
  fi
  
  spotify vol $saved_volume >/dev/null
  # printf "resuming saved_volume: $saved_volume"
}

sprev() {
  spotify prev
}

snext() {
  spotify next
}

# Control volume
svol() {
  spotify vol $1
}

# Control position
spos() {
  spotify pos $1
}

# Show spotify status
sstat() {
  spotify status
}

# Play my californian playlist
_splay_california() {
  spotify play uri spotify:playlist:2E6SKXNUFFHm1RSVbXzY3i
}

# Play Lo-Fi Beats
_splay_lofi() {
  spotify play uri spotify:playlist:37i9dQZF1DWWQRwui0ExPn
}

_splay_nostalgia_en() {
  spotify play uri spotify:playlist:69DBzmNjUb8nHlqIoZrqRn
}

# Play my nostalgic playlist
_splay_nostalgia_pl() {
  spotify play uri spotify:playlist:09cuSyQXHYTEq8OXLHmuBn
}

# Load my private scripts
# . ~/my_scripts
