#!/bin/bash

source "${SHARED_SCRIPTS_DIR}/installation/install-neovim.sh"

emerge --ask=n --noreplace \
  app-misc/fastfetch \
  app-shells/starship \
  app-shells/zoxide \
  dev-vcs/git \
  net-misc/keychain \
  sys-apps/eza

emerge --ask=n gui-wm/hyprland
