# Projects
alias rudy_android='cd ~/dev/android/discover-rudy-android'
alias rudy_functions='cd ~/dev/node/discover-rudy-functions'
alias buildcpp='clang++ -std=c++17 -stdlib=libc++ -o program.out'
alias buildc='clang -std=c18 -o program.out'

alias lsd="lsd -lah"
alias lsl="ls -lah"
alias lso="ls -oah"
alias cls="clear"

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
    echo "( ͡° ʖ̯ ͡°)"
  else
    echo "( ͡° ͜ʖ ͡°)"
  fi
}

# ------ Spotify ------

# Play song passed as argument
s() {
  # saved_volume=$(spotify vol)
  saved_volume="Current Spotify volume level is 50."
  
  if [[ "$saved_volume" =~ [0-9][0-9]?[0-9]? ]]; then
    saved_volume=$MATCH
  fi
  
  
  spotify vol 0 >/dev/null
  spotify pause >/dev/null
  song_name="$@"
  
  # Shortcuts for my playlists
  if [[ ! -z $song_name ]]; then
    if [[ $song_name == "cali" ]]; then
      echo "Dreaaam of Californicaaation..."
      _splay_california
      elif [[ $song_name == "nost" ]]; then
      echo "Playing nostalgic playlist..."
      _splay_nostalgia
      elif [[ $song_name == "lofi" ]]; then
      echo "Just chillin..."
      _splay_lofi
    else
      echo "Searching for \"$song_name\""
      spotify play $song_name
    fi
  fi
  
  spotify vol $saved_volume >/dev/null
  
  sstat
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

# Play my nostalgic playlist
_splay_nostalgia() {
  spotify play uri spotify:playlist:09cuSyQXHYTEq8OXLHmuBn
}

# Load my private scripts
# . ~/my_scripts
