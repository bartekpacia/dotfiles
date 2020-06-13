# README
#
# Official Major League Hacks Theme
#
# Goals
#
# Simplify your setup
# Show stuff that you need while hacking
# Be modern and easy to view
#

# Feel free to customize!

export AT_SYMBOL=" at "
export IN_SYMBOL=" in "
export ON_SYMBOL=" on "
export BRANCH_COLOR="%{$FG[white]%}"
export TIME_COLOR="%{$FG[blue]%}"
export SYMBOL=">"

username() {
   echo "%{$FG[001]%}%n%{$reset_color%}"
}

# Returns device name 
device() {
   echo "%{$FG[033]%}%m%{$reset_color%}"
}

# The current directory
directory() {
   echo "%{$FG[220]%}%1~%{$reset_color%}"
}

# Current time with milliseconds
current_time() {
   echo "$TIME_COLOR%*%{$reset_color%}"
}

# Return status of the last command
return_status() {
   # %{$BG[046]%}
   echo "%(?..%{$FG[001]%}out %?)%{$reset_color%}"
}

# Set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX="${ON_SYMBOL}${BRANCH_COLOR}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# %B and %b make the text bold
PROMPT='%B$(username)$AT_SYMBOL$(device)$IN_SYMBOL$(directory)$(git_prompt_info)%b $SYMBOL '
RPROMPT="$(return_status) $(current_time)"