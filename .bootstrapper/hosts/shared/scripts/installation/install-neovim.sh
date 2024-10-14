#!/bin/bash

# installs neovim and set up
emerge --ask=n --noreplace app-editors/neovim
eselect editor set '/usr/bin/nvim'
source /etc/profile
