# customized properties on all interactive shells
# this is is sourced by .bash_profile

# silence bash deprecation by zsh
export BASH_SILENCE_DEPRECATION_WARNING=1
# add homebrew to the PATH
export PATH="/opt/homebrew/bin:$PATH"

# set prompt styles
BOLD="$(tput bold)"
RESET="$(tput sgr0)"

# set prompt colors - normal
NORMAL_BLACK="$(tput setaf 0)"
NORMAL_RED="$(tput setaf 1)"
NORMAL_GREEN="$(tput setaf 2)"
NORMAL_ORANGE="$(tput setaf 3)"
NORMAL_BLUE="$(tput setaf 4)"
NORMAL_PURPLE="$(tput setaf 5)"
NORMAL_CYAN="$(tput setaf 6)"
NORMAL_GREY="$(tput setaf 7)"

# set prompt colors - bright
BRIGHT_BLACK="$(tput setaf 8)"
BRIGHT_RED="$(tput setaf 9)"
BRIGHT_GREEN="$(tput setaf 10)"
BRIGHT_ORANGE="$(tput setaf 11)"
BRIGHT_BLUE="$(tput setaf 12)"
BRIGHT_PURPLE="$(tput setaf 13)"
BRIGHT_CYAN="$(tput setaf 14)"
BRIGHT_GREY="$(tput setaf 15)"

# set the prompt
export PS1=""
# set the user @ host prompt
export PS1+="${BOLD}${BRIGHT_CYAN}\u${RESET}${BRIGHT_BLUE}@\h"
export PS1+="${RESET} "
# set the path prompt
export PS1+="${BOLD}${BRIGHT_ORANGE}\w"
export PS1+="${RESET} "
# set the symbol prompt
export PS1+="${BRIGHT_RED}$?\$"
export PS1+="${RESET} "
# set the terminal font color
export PS1+="${RESET}"

# add zoxide to shell - a smarter cd
eval "$(zoxide init --cmd cd bash)"
# add fnm to shell - fast node manager
eval "$(fnm env)"
