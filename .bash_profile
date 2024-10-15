#!/bin/bash

# sourced by bash login shells
shopt -q login_shell && [ -f "${HOME}/.bashrc" ] && source ${HOME}/.bashrc

case $(uname -n) in
gentoo-laptop-msi-es)
  echo 'start hyprland'
  ;;
esac
