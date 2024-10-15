#!/bin/bash

# this script installs Gentoo on a system using the gentoo-installer script
# from https://github.com/pedrojoaopereira/gentoo-installer
# and bootstraps the dotfiles from this repository with yadm

# .install-gentoo.sh
#     usage: .install-gentoo.sh <hostname>

# gentoo can only be installed on a system from a Debian-base live ISO
# due to 'apt' being used to install the required dependencies here

# -------------------------------------------------------------------------

# checks if hostname is not provided
[[ $# -ne 1 ]] && echo 'Usage: .install-gentoo.sh <hostname>' && exit 1
# checks if not a debian-base system
[[ -z $(command -v apt) ]] && echo 'Not a Debian-base system, missing "apt"' && exit 1

# gets installation username
USERNAME=$(curl -s https://raw.githubusercontent.com/pedrojoaopereira/gentoo-installer/refs/heads/main/hosts/$1.props | grep scripted_user | cut -d '=' -f2-)
[[ -z ${USERNAME} ]] && echo 'Hostname not found in gentoo-installer templates' && exit 1

# installs required gentoo-installer dependencies
apt update && apt install curl wget git -y

# installs gentoo from https://github.com/PedroJoaoPereira/gentoo-installer
bash <(curl -s https://raw.githubusercontent.com/pedrojoaopereira/gentoo-installer/refs/heads/main/web-install.sh) $1

# chroots back into the system to bootstrap with yadm
chroot /mnt/gentoo /bin/bash <<EOF
# updates environment settings
env-update && source /etc/profile && export PS1="(chroot) \${PS1}"

# installs yadm and bootstraps dotfiles
(equery --quiet list app-admin/yadm >/dev/null) || emerge --ask=n --noreplace app-admin/yadm || exit 1
su - ${USERNAME} -c 'yadm clone -f --no-bootstrap https://github.com/pedrojoaopereira/dotfiles.git'
/home/${USERNAME}/.config/yadm/bootstrap
EOF
