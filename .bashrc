# silence bash deprecation by zsh
export BASH_SILENCE_DEPRECATION_WARNING=1
# silence homebrew hints
export HOMEBREW_NO_ENV_HINTS=1
# enabling gpg-agent ioctl
export GPG_TTY=$(tty)

# add custom personal scripts to path if they are not there
[ "${PATH#*$HOME/.local/bin:}" == "$PATH" ] && export PATH="$HOME/.local/bin:$PATH"
# add homebrew to the PATH
export PATH="/opt/homebrew/bin:$PATH"

# change starship configuration location
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# add starship prompt customization
eval "$(starship init bash)"
# add zoxide to shell - a smarter cd
eval "$(zoxide init --cmd cd bash)"
# add fnm to shell - fast node manager
eval "$(fnm env)"

alias ls='eza --long --icons --all --sort=type' # alias for ls with eza
alias vi='nvim' # alias for neovim

alias ~='cd ~'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
