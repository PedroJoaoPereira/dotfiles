#!/bin/bash

# stows the portage directory
emerge --ask=n --noreplace app-admin/stow
STOWABLE_ROOT_DIR="${STOWABLES_DIR}/root"
(cd "${STOWABLE_ROOT_DIR}" && stow -v -D . --target=/)
(cd "${STOWABLE_ROOT_DIR}" && stow -v . --target=/ --adopt)
su chuck -c '(cd /home/chuck && yadm restore *)'
emerge --ask=n --verbose --update --deep --changed-use --with-bdeps=y --backtrack=30 @world
emerge --ask=n --depclean
eclean distfiles
eclean packages
eclean-kernel -n 2
eselect news read >/dev/null 2>&1
