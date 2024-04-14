#!/bin/bash

# holds the directory of the script caller
scriptPath="${BASH_SOURCE[0]:-$0}"
# solves the case of the symlink
while [ -h "$scriptPath" ]; do
    cd "$(dirname -- "$scriptPath")"
    scriptPath="$(readlink -f -- "$scriptPath")"
done

# remove old configurations - this is dangerous if no backups
# for me if it is not checked in, it is not important
echo "install_zsh >> Removing old configurations"
rm -rf ~/.zshrc*

# stow the zshrc from the parent directory of this script
echo "install_zsh >> Stowing zshrc"
(cd "$(dirname -- "$scriptPath")/.." && stow -t ~ zshrc/)

# reloads zsh shell
echo "install_zsh >> Reloading zsh"
zsh
