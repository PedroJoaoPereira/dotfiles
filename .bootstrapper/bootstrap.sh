#!/bin/bash

# installs yadm and bootstraps dotfiles
emerge --ask=n app-admin/yadm
su - chuck -c 'yadm clone -f --no-bootstrap https://github.com/pedrojoaopereira/dotfiles.git'
source "/home/chuck/.config/yadm/bootstrap"
