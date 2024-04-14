# customized properties on all interactive shells
# this is is sourced by .bash_profile

# set the prompt
export PS1='[ \u@\h ] \w $?\$ '

# silence bash deprecation by zsh
export BASH_SILENCE_DEPRECATION_WARNING=1
# add homebrew to the PATH
export PATH="/opt/homebrew/bin:$PATH"
