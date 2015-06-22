# Apple Sauce | OS X Primer

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make a shortcut for Sublime Text alias.
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Install Preferences
  # .bash_profile, .gitconfig, .gitignore
  cp ./.[^.]* ~/
  # Application Preferences
  cp ./preferences/*.plist ~/Library/Preferences/
  # Sublime Text Settings
  cp ./preferences/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
  # Display folders first when sorted by kind.
  cp ./preferences/InfoPlist.strings /System/Library/CoreServices/Finder.app/Contents/Resources/English.lproj/
  # Enable text selection in Quick Look.
  defaults write com.apple.finder QLEnableTextSelection -bool TRUE