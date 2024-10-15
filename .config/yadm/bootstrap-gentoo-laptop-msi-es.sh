#!/bin/bash

# executes as root if not already
[[ ${EUID} -ne 0 ]] && exec doas $0 $@
# ---------------------------------------------------------------------------
# after this point, the script is running as root

# symlinks root directory
(equery --quiet list app-admin/stow >/dev/null) || emerge --ask=n --noreplace app-admin/stow || return 1
(cd /home/chuck/.stows/gentoo-laptop-msi-es/root && stow -D . --target=/) || return 1
(cd /home/chuck/.stows/gentoo-laptop-msi-es/root && stow . --target=/ --adopt) || return 1
su chuck -c 'cd /home/chuck && yadm restore .' # clears any adopted files in the home directory
emerge --ask=n --verbose --update --deep --changed-use --with-bdeps=y --backtrack=30 @world || return 1

# configures initramfs
dracut --force --quiet --kver $(eselect kernel list | grep '*' | grep -o 'linux-.* ' | sed 's/linux-//g') || return 1
grub-mkconfig -o /boot/grub/grub.cfg || return 1

# installs dependencies
deps=(
  app-editors/neovim
  app-misc/fastfetch
  app-misc/neofetch
  app-shells/starship
  app-shells/zoxide
  dev-vcs/git
  gui-wm/hyprland
  net-im/discord
  sys-apps/eza
  sys-firmware/intel-microcode
  sys-process/btop
  www-client/google-chrome
  x11-terms/alacritty
)
for dep in ${deps[@]}; do
  (equery --quiet list ${dep} >/dev/null) || emerge --ask=n --noreplace ${dep} || return 1
done

# sets default editor to neovim
[[ -z $(eselect editor list | grep '*' | grep /usr/bin/nvim) ]] && eselect editor set '/usr/bin/nvim' && env-update && source /etc/profile

# removes unused packages
emerge --ask=n --depclean >/dev/null
# removes unused libraries, binaries and outdated kernels
eclean distfiles && eclean packages && eclean-kernel -n 2
# ignores news
eselect news read >/dev/null 2>&1
