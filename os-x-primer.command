# Apple Sauce

# Enable text selection in Quick Look.
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make a shortcut for Sublime Text alias.
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Install preferences.
cp ./.[^.]* ~/
cp ./preferences/*.plist ~/Library/Preferences/
cp ./preferences/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/