#!/bin/bash

# holds the directory of the script caller
scriptPath="${BASH_SOURCE[0]:-$0}"
# solves the case of the symlink
while [ -h "$scriptPath" ]; do
    cd "$(dirname -- "$scriptPath")"
    scriptPath="$(readlink -f -- "$scriptPath")"
done

# remove old omz configurations - this is dangerous if no backups
# for me if it is not checked in, it is not important
echo "install_omz >> Removing old configurations"
rm -rf ~/.zshrc* ~/.oh-my-zsh

# install oh-my-zsh without overriding the old zshrc with flag --keep-zshrc
echo "install_omz >> Installing oh-my-zsh"
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- --keep-zshrc

# stow the omz custom theme from the parent directory of this script
echo "install_omz >> Stowing omz custom theme"
(cd "$(dirname -- "$scriptPath")/../stowed" && stow -t ~ omz/)
