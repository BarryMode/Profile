#!/usr/bin/env bash

# macOS Prime
echo 'Welcome to macOS Prime.'

# clone_check: check if you have a repo
# example: clone_check https://github.com/user/repo.git ~/Projects/GitHub/repo
function clone_check() {
  REPOSRC=$1
  LOCALREPO=$2
  LOCALREPO_VC_DIR=$LOCALREPO/.git

  if [ ! -d $LOCALREPO_VC_DIR ]; then
    git clone $REPOSRC $LOCALREPO
  fi
}

# link_check: check if a symlink exists
# example: link_check ~/Projects/GitHub/repo ~/repo
function link_check() {
  if [ ! -h $2 ]; then
    ln -s $1 $2
  fi
}

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

echo; echo ---; echo

read -p 'Install Hosts? (y/n) ' answer
case ${answer:0:1} in
  y )
  echo 'Installing Hosts…'
  cd ~/prime/hosts
  python ~/prime/hosts/install.py --auto --replace
  rm -rf ~/prime/hosts/hosts
  ;;
esac

cd ~