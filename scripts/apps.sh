#!/usr/bin/env bash

# Mac OS X application installs
#
# This installs all required applications or downloads the others for manual installation.
#
# Wes Kennedy
# wes.kennedy@gmail.com
# https://github.com/whiskykilo/macbuild
#

echo "Installing Brew Apps"
###       ###
# Brew Apps #
###       ###

brew install ack
brew install ansible
brew install atk
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
brew install shellcheck
brew install wget
brew install xz

echo "Installing Brew Cask Apps"
###            ###
# Brew Cask Apps #
###            ###

brew cask install atom
brew cask install bartender
brew cask install bittorrent-sync
brew cask install caffeine
brew cask install carbon-copy-cloner
brew cask install crashplan
brew cask install dropbox
brew cask install evernote
brew cask install flux
brew cask install google-chrome
brew cask install hipchat
brew cask install istat-menus
brew cask install iterm2
brew cask install little-snitch
brew cask install macvim
brew cask install onepassword
brew cask install spotify
brew cask install vagrant
brew cask install virtualbox
brew cask install vmware-fusion

echo "Time to install Wireshark with GTK3"
###                 ###
# Wireshark with GTK3 #
###                 ###

source ../plugins.d/wireshark.sh

###            ###
# GitHub for Mac #
###            ###

source ../plugins.d/githubmac.sh

###             ###
# Bash Completion #
###             ###

source ../plugins.d/bash-completion.sh

###                             ###
# Finalize Little Snitch Settings #
###                             ###

source ../plugins.d/littlesnitch.sh
