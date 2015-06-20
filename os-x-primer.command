# OS X Primer

# Enable text selection in Quick Look.
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Create shortcut for Sublime Text alias.
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Install personal settings.
cp .bash_profile ~/
cp .gitconfig ~/
cp com.apple.Terminal.plist ~/Library/Preferences/
cp Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/