#!/usr/bin/env bash
echo
# macOS Prime
echo 'macOS Prime'
echo '--------------------------------------------------------------------------------'
echo

# Dotfiles
echo 'Dotfiles'
echo '--------------------------------------------------------------------------------'
echo
echo 'Installing Dotfiles…'
chmod +x ~/prime/dotfiles/install.sh
~/prime/dotfiles/install.sh --force
echo

# Packages
echo 'Packages'
echo '--------------------------------------------------------------------------------'
echo
echo 'Installing Packages…'
chmod +x ~/prime/packages/install.sh
~/prime/packages/install.sh
echo

# Hosts
echo 'Hosts'
echo '--------------------------------------------------------------------------------'
echo
echo 'Installing Hosts…'
chmod +x ~/prime/hosts/install.sh
~/prime/hosts/install.sh
echo

# Preferences
echo 'Preferences'
echo '--------------------------------------------------------------------------------'
echo
echo 'Installing Preferences…'
~/.macos
echo 'Assembling Dock…'
~/.dock
