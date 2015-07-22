# OS X Prime
echo 'Welcome to OS X Prime.'

cd Scripts/os-x-prime/
./prime/dev.sh  # Development
./prime/pref.sh # Preferences

echo ; echo 'Restarting Dock...'
killall Dock
echo 'Restarting Finder...'
killall Finder