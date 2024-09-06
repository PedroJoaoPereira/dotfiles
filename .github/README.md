# dotfiles

Start by setting up shell:

```bash
# changes default shell to bash
chsh -s /bin/bash
```

Change MacOS defaults:

```bash
# changes macos defaults
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write com.apple.finder AppleShowAllFiles true
killall Finder
# disables terminal session restore
rm -rf ~/Library/Saved\ Application\ State/com.apple.Terminal.savedState/
chflags uchg ~/Library/Saved\ Application\ State/com.apple.Terminal.savedState/
```
Install `homebrew`:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Set `brew` command in shell:

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Install required dependencies:

```bash
brew install yadm
```

Set up dotfiles:

```bash
yadm clone -b macos-work-laptop https://github.com/PedroJoaoPereira/dotfiles.git --bootstrap
```

For `vscode` extensions, install `BhargavDetroja.export-your-extensions` from the marketplace and import `extensions.json` file.
