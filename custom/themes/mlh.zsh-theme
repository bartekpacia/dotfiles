# The Official Theme of Major League Hacking

##     ## ##       ##     ##
###   ### ##       ##     ##
#### #### ##       ##     ##
## ### ## ##       #########
##     ## ##       ##     ##
##     ## ##       ##     ##
##     ## ######## ##     ##

# # # # # # # # # # # # # # # # # #
# # # Feel free to customize! # # #
# # # # # # # # # # # # # # # # # #

# To customize symbols (e.g MLH_AT_SYMBOL), simply set them as environment variables
# for example in your ~/.zshrc file, like this:
# export MLH_AT_SYMBOL=" at "

# Hint: to easily discover colors and their codes, type `spectrum_ls` in the terminal

# right prompt default settings
if [ -z "$MLH_PRINT_EXIT_CODE" ]; then
  MLH_PRINT_EXIT_CODE=true
fi

if [ -z "$MLH_PRINT_TIME" ]; then
  MLH_PRINT_TIME=false
fi

# symbols default settings

if [ -z "$MLH_AT_SYMBOL" ]; then
  MLH_AT_SYMBOL="@"
fi

if [ -z "$MLH_IN_SYMBOL" ]; then
  MLH_IN_SYMBOL=" in "
fi

if [ -z "$MLH_ON_SYMBOL" ]; then
  MLH_ON_SYMBOL=" on "
fi

if [ -z "$MLH_SHELL_SYMBOL" ]; then
  MLH_SHELL_SYMBOL="$ "
fi

# colors
USER_COLOR="%F{001}"
DEVICE_COLOR="%F{033}"
DIR_COLOR="%F{220}"
BRANCH_COLOR="%F{001}"
TIME_COLOR="%F{033}"

username() {
  echo "$USER_COLOR%n%f"
}

# Prints device name
device() {
  echo "$DEVICE_COLOR%m%f"
}

# Prints the current directory
directory() {
  echo "$DIR_COLOR%1~%f"
}

# Prints current time
current_time() {
  if [ "$MLH_PRINT_TIME" = true ]; then
    echo " $MLH_PRINT_TIME%*%f"
  fi
}

# Prints exit code of the last executed command
exit_code() {
  if [ "$MLH_PRINT_EXIT_CODE" = true ]; then
    echo "%(?..%F{001}exit %?)%f"
  fi
}

prompt_end() {
  printf "\n$MLH_SHELL_SYMBOL"
}

# Set git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX="${MLH_ON_SYMBOL}${BRANCH_COLOR}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# %B and %b make the text bold
PROMPT='%b$(username)$MLH_AT_SYMBOL$(device)$MLH_IN_SYMBOL$(directory)$(git_prompt_info)%b$(prompt_end)'
RPROMPT="$(exit_code)$(current_time)"
