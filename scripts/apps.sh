#!/usr/bin/env bash

# Mac OS X application installs
#
# This installs all required applications or downloads the others for manual installation.
#
# Wes Kennedy
# wes.kennedy@gmail.com
# https://github.com/whiskykilo/macbuild
#

###       ###
# Brew Apps #
###       ###

brew install ack
brew install ansible
brew install atk
brew install bash-completion
brew install c-ares
brew install ccache
brew install d-bus
brew install fontconfig
brew install freetype
brew install gettext
brew install geoip
brew install git
brew install glib
brew install gmp
brew install gnutls
brew install gsettings-desktop-schemas
brew install hicolor-icon-theme
brew install hub
brew install icu4c
brew install libffi
brew install libgcrypt
brew install libpng
brew install libtasn1
brew install libtiff
brew install lua
brew install mtr
brew install nmap
brew install node
brew install pixman
brew install pkg-config
brew install portaudio
brew install rbenv
brew install ruby-build
brew install shellcheck
brew install wget
brew install xz





###            ###
# Brew Cask Apps #
###            ###

brew cask install caffeine
brew cask install dropbox
brew cask install one-password
brew cask install iterm2
brew cask install virtualbox
brew cask install vagrant
brew cask install istat-menus
brew cask install google-chrome
brew cask install Skype
brew cask install bittorrent-sync
brew cask install crashplan
brew cask install evernote
brew cask install atom
brew cask install bartender
brew cask install carbon-copy-cloner
brew cask install gimp
brew cask install hipchat
brew cask install little-snitch
brew cask install macvim
brew cask install spotify
brew cask install flux
brew cask install vmware-fusion
brew cask install airmail-amt

###            ###
# Install Jekyll #
###            ###

gem install jekyll

###                 ###
# Wireshark with GTK3 #
###                 ###

cd $(brew --repository)
hub pull https://github.com/rbalint/homebrew-gtk-quartz

brew link --overwrite gsettings-desktop-schemas
brew install --build-from-source at-spi2-core at-spi2-atk cairo harfbuzz pango gtk+3 gtk+ librsvg gnome-themes-standard wireshark --without-x --without-x11 --with-gtk+3

cd ${HOME}

mkdir -p .config/gtk-3.0
echo "[Settings]" > .config/gtk-3.0/settings.ini
echo "gtk-theme-name = Adwaita" >> .config/gtk-3.0/settings.ini
