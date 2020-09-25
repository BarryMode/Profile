#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  # sync all files, minus those listed
  rsync --exclude ".git/" \
  --exclude ".DS_Store" \
  --exclude "install.sh" \
  --exclude "LICENSE.md" \
  --exclude "README.md" \
  -avh --no-perms . ~;
  source ~/.profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[y]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
