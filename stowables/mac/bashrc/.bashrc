# customized properties on all interactive shells
# this is is sourced by .bash_profile

# silence bash deprecation by zsh
export BASH_SILENCE_DEPRECATION_WARNING=1
# add homebrew to the PATH
export PATH="/opt/homebrew/bin:$PATH"

# set the prompt
export PS1='\u@\h:\w $?\$ '

# add zoxide to shell - a smarter cd
eval "$(zoxide init --cmd cd bash)"
# add fnm to shell - fast node manager
eval "$(fnm env)"
