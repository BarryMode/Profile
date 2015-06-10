# OS X Primer

# OS X | Enable text selection in Quick Look.
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# OS X | Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# OS X | Create shortcut for Sublime Text alias.
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl