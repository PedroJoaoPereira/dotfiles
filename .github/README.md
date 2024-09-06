# dotfiles

```bash
# changes default shell to bash
chsh -s /bin/bash

# changes macos defaults
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write com.apple.finder AppleShowAllFiles true
killall Finder

# disables terminal session restore
rm -rf ~/Library/Saved\ Application\ State/com.apple.Terminal.savedState/
chflags uchg ~/Library/Saved\ Application\ State/com.apple.Terminal.savedState/
```

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install yadm
yadm clone -b macos-work-laptop https://github.com/PedroJoaoPereira/dotfiles.git --bootstrap
```

For `vscode` extensions, install `BhargavDetroja.export-your-extensions` from the marketplace and import `extensions.json` file.
