# macOS Prime
echo 'Welcome to macOS Prime.'

./dev.sh  # Development
./pref.sh # Preferences

echo ; echo 'Restarting Dock...'
killall Dock
echo 'Restarting Finder...'
killall Finder