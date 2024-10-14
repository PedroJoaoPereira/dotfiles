#!/bin/bash

# checks if not root and requests root permissions
[[ $EUID -ne 0 ]] && exec doas "$0" "$@"
