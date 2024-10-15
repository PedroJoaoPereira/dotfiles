#!/bin/bash

# exits if the shell is not interactive
[[ $- != *i* ]] && return

case $(uname -n) in
gentoo-laptop-msi-es)
  # adds local bin directory to PATH
  [[ ":${PATH}:" != *":${HOME}/.local/bin:"* && -d "${HOME}/.local/bin" ]] && export PATH="${HOME}/.local/bin:${PATH}"
  # starts ssh-agent if not already running
  [[ -z ${SSH_AGENT_PID+x} ]] && eval "$(ssh-agent -s)" >/dev/null
  # starts starship prompt
  [[ ! -z $(command -v starship) ]] && eval "$(starship init bash)"
  # starts zoxide
  [[ ! -z $(command -v zoxide) ]] && eval "$(zoxide init --cmd cd bash)"
  # sets up aliases
  alias doas='doas '                              # alias for doas
  alias reboot='doas reboot'                      # alias for reboot
  alias shutdown='doas shutdown -h now'           # alias for shut down now
  alias ls='eza --long --icons --all --sort=type' # alias for ls with eza
  alias vi='nvim'                                 # alias for neovim
  alias ~='cd ~'
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../..'
  ;;
esac
