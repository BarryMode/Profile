# Permissions
echo ; echo '--- Permissions' ; echo
echo 'Granting Executive Rights...'
sudo chown -R $(whoami):admin /usr/local
# find $HOME -type d -perm 777 -exec chmod 755 {} \; -print
# find $HOME -type f \( -perm 777 -o -perm 666 \) -exec chmod 644 {} \; -print

# Dot configs
echo ; echo 'Loading dot configs...'
ditto ./Settings/.[^.]* ~/

# Xcode
echo ; echo '--- Xcode' ; echo

read -p 'Install Xcode Command Line Tools? * (y/n) ' answer
case ${answer:0:1} in
  y|Y|yes|Yes )
  echo 'Installing Xcode Command Line Tools...'
  xcode-select --install
  ;;
esac

# Ruby
echo ; echo '--- Ruby' ; echo

read -p 'Install RubyGems? (y/n) ' answer
case ${answer:0:1} in
  y|Y|yes|Yes )
  # Jekyll
  echo 'Installing Jekyll...'
  sudo gem install jekyll
  # Sass
  echo 'Installing Sass...'
  sudo gem install sass
  # Wayback Machine Downloader
  echo 'Installing Wayback Machine Downloader...'
  gem install wayback_machine_downloader
  ;;
esac

echo ; echo 'Updating RubyGems...'
sudo gem update --system

# Shell
echo ; echo '--- Shell' ; echo

read -p 'Install Homebrew? (y/n) ' answer
case ${answer:0:1} in
  y|Y|yes|Yes )
  echo 'Installing Homebrew...'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
  ;;
esac

echo ; echo 'Updating Homebrew...'
brew update

read -p 'Install Shell Extensions? (y/n) ' answer
case ${answer:0:1} in
  y|Y|yes|Yes )
  # Ack
  echo ; echo 'Installing Ack...'
  brew install ack
  # GCC
  echo ; echo 'Installing GCC...'
  brew install gcc49
  # QT5
  echo ; read -p 'Install QT5? (y/n) ' answer
  case ${answer:0:1} in
  y|Y|yes|Yes )
    echo 'Installing QT5...'
    brew install qt5 #--with-docs --with-developer --with-d-bus --with-mysql
    ;;
  esac
  # FileBot
  echo ; echo 'Installing FileBot...'
  brew cask install filebot
  # Qlvideo
  echo ; echo 'Installing Qlvideo...'
  brew cask install qlvideo
  # Youtube-dl
  echo ; echo 'Installing Youtube-dl...'
  brew install youtube-dl
  # FFmpeg
   echo ; echo 'Installing FFmpeg...'
  brew install ffmpeg
  ;;
esac

echo ; echo 'Upgrading Homebrew Packages...'
brew upgrade

# Python
echo ; echo '--- Python' ; echo
read -p 'Install Python? (y/n) ' answer
case ${answer:0:1} in
  y|Y|yes|Yes )
  echo 'Installing Python...'
  brew install python
  ;;
esac

# NodeJS
echo ; echo '--- NodeJS' ; echo
read -p 'Install NodeJS? (y/n) ' answer
case ${answer:0:1} in
  y|Y|yes|Yes )
  echo 'Installing NodeJS...'
  brew install node010
  ;;
esac

read -p 'Install Node Modules? (y/n) ' answer
case ${answer:0:1} in
  y|Y|yes|Yes )
  # Electron
  echo 'Installing Electron...'
  sudo npm install -g electron-prebuilt
  # Gulp
  echo 'Installing Gulp...'
  sudo npm install -g gulp gulp-util bower gulp-concat gulp-sass gulp-minify-css gulp-rename shelljs
  # Moment
  echo 'Installing Moment...'
  sudo npm install -g moment
  # Node-Fetch
  echo 'Installing Node-Fetch...'
  sudo npm install -g node-fetch
  # Underscore
  echo ; echo 'Installing Underscore...'
  sudo npm install -g underscore
  ;;
esac

echo ; echo 'Updating Node Packages...'
npm update