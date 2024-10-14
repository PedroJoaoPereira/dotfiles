#!/bin/bash

# gets this script directory for relative imports
export BOOTSTRAPPER_DIR=$(dirname $(readlink -f $0))

# installs gentoo from https://github.com/PedroJoaoPereira/gentoo-installer
apt update
apt install curl -y
bash <(curl -s https://raw.githubusercontent.com/pedrojoaopereira/gentoo-installer/refs/heads/main/web-install.sh) $1

# copies bootstrap script to chroot
cp ${BOOTSTRAPPER_DIR}/bootstrap.sh /mnt/gentoo/bootstrap.sh
chroot /mnt/gentoo /bin/bash <<EOF
source /etc/profile && export PS1="(chroot) \${PS1}"
source bootstrap.sh
rm -rf bootstrap.sh
EOF
