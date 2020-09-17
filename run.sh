#!/usr/bin/env bash
echo
# macOS Prime
echo 'run:"macos_prime"<>'
echo

# Dotfiles
echo 'Dotfiles'
echo '················································································'
echo
echo 'Installing Dotfiles…'
chmod +x ~//dotfiles/install.sh
~//dotfiles/install.sh --force
echo

# Packages
echo 'Packages'
echo '················································································'
echo
echo 'Installing Packages…'
chmod +x ~//packages/install.sh
~//packages/install.sh
echo

# Preferences
echo 'Preferences'
echo '················································································'
echo
echo 'Setting Preferences…'
~/.macos
echo 'Assembling Dock…'
~/.dock
