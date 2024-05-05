#!/bin/bash

# holds the directory of the script caller
scriptPath="${BASH_SOURCE[0]:-$0}"
# solves the case of the symlink
while [ -h "$scriptPath" ]; do
  cd "$(dirname -- "$scriptPath")"
  scriptPath="$(readlink -f -- "$scriptPath")"
done

# create variables
messagePrefix="install_bash >>"

# remove old configurations - this is dangerous if no backups
# for me if it is not checked in, it is not important
echo "${messagePrefix} Removing old configurations"
rm -rf ~/.bash_profile ~/.bashrc*

# stow bashrc from the parent directory of this script
echo "${messagePrefix} Stowing bashrc"
(cd "$(dirname -- "$scriptPath")/../../stowables/mac" && stow -t ~ bashrc/)

# reloads the bashrc
echo "${messagePrefix} Reloading bash"
source ~/.bash_profile
