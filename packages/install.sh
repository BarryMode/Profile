#!/usr/bin/env bash

cd ~//packages/
chmod +x *.sh

# Brew: The missing package manager for macOS
# https://github.com/Homebrew/brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew tap "homebrew/bundle"
brew bundle
brew cleanup
brew services cleanup
brew doctor
# Switch to using brew-installed bash as default shell
BREW_PREFIX=$(brew --prefix) # Homebrew's installed location
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# NPM: The package manager for JavaScript
# https://github.com/npm/cli
npm install -g $(cat npmfile)
npm update -g

# PIP: The PyPA recommended tool for installing Python packages
# https://github.com/pypa/pip
pip3 install --upgrade $(cat pipfile)

# Other Applications
# FileBot
echo 'Manually Install FileBot'
# Grabber
echo 'Manually Install Grabber'
