#!/usr/bin/env bash

# macOS Prime
echo 'Welcome to macOS Prime.'

function clone_check() {
  REPOSRC=$1
  LOCALREPO=$2
  LOCALREPO_VC_DIR=$LOCALREPO/.git

  if [ ! -d $LOCALREPO_VC_DIR ]; then
    git clone $REPOSRC $LOCALREPO
  fi
}

function link_check() {
  if [ ! -h $2 ]; then
    ln -s $1 $2
  fi
}

clone_check https://github.com/itssohma/dotfiles.git ~/Projects/GitHub/macos-prime/dotfiles
link_check ~/Projects/GitHub/macos-prime ~/prime

echo; echo ---; echo

read -p 'Install Dotfiles? (y/n) ' answer
case ${answer:0:1} in
  y )
  echo 'Installing Dotfiles…'
  ~/prime/dotfiles/install.sh
  ;;
esac

echo; echo ---; echo

read -p 'Install macOS Preferences? (y/n) ' answer
case ${answer:0:1} in
  y )
  echo 'Installing macOS Preferences…'
  ~/.macos
  ;;
esac

echo; echo ---; echo

read -p 'Install Applications? (y/n) ' answer
case ${answer:0:1} in
  y )
  echo 'Installing Applications…'
  ~/prime/applications/install.sh
  ;;
esac