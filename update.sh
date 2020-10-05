#!/usr/bin/env bash
echo
echo ':update'
echo
sama
cd ~
echo
echo 'Symlinks'
echo '················································································'
echo
echo 'Updating symlinks…'
~//update:symlinks.sh
echo
echo 'Dotfiles'
echo '················································································'
echo
echo 'Updating dotfiles…'
~//dotfiles/install.sh --force
echo
echo 'MAS'
echo '················································································'
echo
echo 'Updating mas apps…'
mas upgrade
echo
echo 'Homebrew'
echo '················································································'
echo
echo 'Updating brew packages…'
brew upgrade; brew missing; brew upgrade --cask; brew cleanup; brew services cleanup
cd ~//packages/
brew bundle dump --force --describe
cd ~
echo
echo 'NPM'
echo '················································································'
echo
echo 'Updating npm modules…'
npm update -g; npm cache clean --force
echo
echo 'PIP'
echo '················································································'
echo
echo 'Updating python packages…'
pip3 install --upgrade pip
pip3 install -U $(pip freeze | cut -d '=' -f 1)
echo
echo 'Sublime Text'
echo '················································································'
echo
echo 'Backing up Sublime Text settings…'
cp ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Package\ Control.sublime-settings ~//init/
cp ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings ~//init/
echo
echo 'Git Repositories'
echo '················································································'
echo
echo 'Updating git repos…'
cd ~/Documents/Computers/Repos/
for d in *; do pushd $d && git pull && popd; done
cd ~
echo
echo 'macOS'
echo '················································································'
echo
echo 'Running macOS update…'
softwareupdate -i -a
echo
echo 'Cleaning'
echo '················································································'
echo
echo 'Deduping ssh known hosts…'
cat ~/.ssh/known_hosts | uniq > ~/.ssh/known_hosts2; mv ~/.ssh/known_hosts2 ~/.ssh/known_hosts # add "| sort" to list in abc order
echo 'Clear cache…'
rm -rf .cache
rm -rf .composer/cache
rm -rf .expo/*cache
rm -rf .gradle/caches
rm -rf ~/Library/Application\ Support/Keybase/kbfs_block_cache
rm -rf ~/Library/Application\ Support/Google/DriveFS/cef_cache/Cache
rm -rf ~/Library/Developer/CoreSimulator
echo 'Clear clipboard…'
pbcopy < /dev/null
echo 'Clear logs…'
sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
echo 'Empty trash…'
sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash
echo
echo 'Setting Preferences…'
~/.macos
echo
echo 'Assembling Dock…'
~/.dock
echo
echo 'COMPLETE'
