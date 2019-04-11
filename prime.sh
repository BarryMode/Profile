#!/usr/bin/env bash

# macOS Prime
echo 'macOS Prime'
ln -sf ~/Projects/macos-prime ~/prime

echo; echo ---; echo

# Dot Files
read -p 'Install Dotfiles? (y/n) ' answer
case ${answer:0:1} in
  y )
  echo 'Installing Dotfiles…'
  ~/prime/dotfiles/install.sh
  ;;
esac

echo; echo ---; echo

# Applications
read -p 'Install Applications? (y/n) ' answer
case ${answer:0:1} in
  y )
  echo 'Installing Applications…'
  ~/prime/applications/install.sh
  ;;
esac

echo; echo ---; echo

# macOS Preferences
read -p 'Install macOS Preferences? (y/n) ' answer
case ${answer:0:1} in
  y )
  echo 'Installing macOS Preferences…'
  ~/.macos
  echo 'Assembling Dock…'
  ~/.dock
  ;;
esac

echo; echo ---; echo

# Hosts
read -p 'Install Hosts? (y/n) ' answer
case ${answer:0:1} in
  y )
  echo 'Installing Hosts…'
  ~/prime/hosts/install.sh
  ;;
esac

cd ~
