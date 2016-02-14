# Permissions
echo ; echo '--- Permissions' ; echo
echo 'Granting Executive Rights...'
sudo chown $(whoami):admin /usr/local/
sudo chown $(whoami):admin /usr/local/*
sudo chown -R $(whoami):admin /usr/local
sudo chown $(whoami):admin /usr/local/sbin/
sudo chown $(whoami):admin /usr/local/share/systemtap/tapset/
find $HOME -type d -perm 777 -exec chmod 755 {} \; -print
find $HOME -type f \( -perm 777 -o -perm 666 \) -exec chmod 644 {} \; -print

# Xcode
echo ; echo '--- Xcode' ; echo
read -p 'Install Xcode Command Line Tools? * (y/n) ' answer
case ${answer:0:1} in
  y|Y )
  echo 'Installing Xcode Command Line Tools...'
  xcode-select --install
  ;;
esac

# Ruby
echo ; echo '--- Ruby' ; echo
read -p 'Update RubyGems? (y/n) ' answer
case ${answer:0:1} in
  y|Y )
  echo 'Updating RubyGems...'
  sudo gem update --system
  ;;
esac

# Jekyll
echo ; read -p 'Install Gem: Jekyll? (y/n) ' answer
case ${answer:0:1} in
  y|Y )
  echo 'Installing Jekyll...'
  sudo gem install -n /usr/local/bin jekyll
  ;;
esac

# Sass
echo ; read -p 'Install Gem: Sass? (y/n) ' answer
case ${answer:0:1} in
  y|Y )
  echo 'Installing Sass...'
  sudo gem install -n /usr/local/bin sass
  ;;
esac

# Homebrew
echo ; echo '--- Homebrew' ; echo
read -p 'Install Homebrew? * (y/n) ' answer
case ${answer:0:1} in
  y|Y )
  echo 'Installing Homebrew...'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
  echo ; echo 'Updating Homebrew...'
  brew update
  ;;
esac

echo ; echo '--- Development Packages' ; echo
read -p 'Install Development Packages? (y/n) ' answer
case ${answer:0:1} in
  y|Y )
  # Ack
  echo ; echo 'Installing Ack...'
  brew install ack
  # GCC
  echo ; echo 'Installing GCC...'
  brew install gcc
  # QT5
  echo ; read -p 'Install QT5? (y/n) ' answer
  case ${answer:0:1} in
  y|Y )
    echo 'Installing QT5...'
    brew install qt5 #--with-docs --with-developer --with-d-bus --with-mysql
    ;;
  esac
  # Node
  echo ; echo 'Installing Node...'
  brew install node
  echo ; echo 'Installing Finder support for video files... (avi, flv, mkv, etc.)'
  brew cask install qlvideo
  echo ; echo 'Upgrading Homebrew Packages...'
  brew upgrade
  # Underscore
  echo ; echo 'Installing Underscore...'
  sudo npm install -g underscore
  # Moment
  echo 'Installing Moment...'
  sudo npm install -g moment
  # Gulp
  echo 'Installing Gulp...'
  sudo npm install -g gulp gulp-util bower gulp-concat gulp-sass gulp-minify-css gulp-rename shelljs
  # Electron
  echo 'Installing Electron...'
  sudo npm install -g electron-prebuilt
  echo ; echo 'Updating Node Packages...'
  npm update
  ;;
esac