#!/usr/bin/env bash

sudo -v

npm install -g lazysizes
npm install -g lodash
npm install -g moment
npm install -g nativefier
npm install -g oboe

nativefier --disable-context-menu --disable-dev-tools --name "Trello" --icon "./icons/Trello.icns" "https://trello.com" "/Applications"