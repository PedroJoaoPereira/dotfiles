# check if non-interactive shell, so nothing gets leaked
if [[ $- != *i* ]] ; then
	return
fi

# add custom personal scripts to path if they are not there
[ "${PATH#*$HOME/.local/bin:}" == "$PATH" ] && export PATH="$HOME/.local/bin:$PATH"

# start authentication agent manager
eval $(keychain --eval --quiet)
# change starship configuration location
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# add starship prompt customization
eval "$(starship init bash)"
# add zoxide to shell - a smarter cd
eval "$(zoxide init --cmd cd bash)"

# alias
alias reboot='doas reboot' # alias for reboot
alias shutdown='doas shutdown -h now' # alias for shut down now

alias doas='doas ' # alias for doas
alias ls='eza --long --icons --all --sort=type' # alias for ls with eza
alias vi='nvim' # alias for neovim

alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
