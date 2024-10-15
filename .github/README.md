# dotfiles

This projects contains all custom dotfiles for customizing the system as well as some useful scripts for bootstrapping new systems. Currently only MacOs and Linux is supported.


## Bootstrap

To bootstrap the system clone this project using `yadm`:

```bash
yadm clone --bootstrap https://github.com/PedroJoaoPereira/dotfiles
```


## Install

It is possible to install gentoo directly to a system and bootstrap it using a project named [gentoo-installer](https://github.com/pedrojoaopereira/gentoo-installer) in a live Debian base system. The `gentoo-installer` script requires a `hostname` so that the system settings are automatically configured.


```bash
apt update
apt install curl -y
bash <(curl -s https://raw.githubusercontent.com/pedrojoaopereira/dotfiles/refs/heads/main/.install-gentoo.sh) gentoo-laptop-msi-es
```
