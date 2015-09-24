# OS X Prime
echo 'Welcome to OS X Prime.'

./dev.sh  # Development
./pref.sh # Preferences

echo ; echo 'Restarting Dock...'
killall Dock
echo 'Restarting Finder...'
killall Finder