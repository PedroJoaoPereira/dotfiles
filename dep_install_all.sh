#!/bin/bash

# holds the directory of the script caller
scriptPath="${BASH_SOURCE[0]:-$0}"
# solves the case of the symlink
while [ -h "$scriptPath" ]; do
    cd "$(dirname -- "$scriptPath")"
    scriptPath="$(readlink -f -- "$scriptPath")"
done

# preserve exit code of the called scripts
set -e

# executes all the scripts in the install directory
echo "install_all >> Executing all install scripts in $(dirname -- "$scriptPath")/install/*.sh"
for script in $(dirname -- "$scriptPath")/install/*.sh; do
    echo "install_all >> Executing script $(basename -- "$script")"
    bash $script
done
