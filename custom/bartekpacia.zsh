# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

# Projects
alias rudy_android='cd ~/dev/android/discover-rudy-android'
alias rudy_functions='cd ~/dev/node/discover-rudy-functions'
alias buildcpp='clang++ -std=c++17 -stdlib=libc++ -o program.out'
alias buildc='clang -std=c18 -o program.out'

alias lsd="lsd -lah"
alias cat="bat"

set_rudy_functions() {
  rudy_functions
  export GOOGLE_APPLICATION_CREDENTIALS="/Users/bartekpacia/dev/node/discover-rudy-functions/serviceAccountKey.json"
  echo "Google credentials set up!"
  nvm use 10
}

devserver_rudy() {
  set_rudy_functions
  cd functions/
  npm run serve
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

. ~/.library.zsh