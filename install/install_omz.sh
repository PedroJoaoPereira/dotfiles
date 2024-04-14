#!/bin/bash

# holds the directory of the script caller
scriptPath="${BASH_SOURCE[0]:-$0}"
# solves the case of the symlink
while [ -h "$scriptPath" ]; do
    cd "$(dirname -- "$scriptPath")"
    scriptPath="$(readlink -f -- "$scriptPath")"
done

# stow the omz custom theme from the parent directory of this script
echo "install_zsh >> Stowing omz custom theme"
(cd "$(dirname -- "$scriptPath")/.." && stow -t ~ omz/)
