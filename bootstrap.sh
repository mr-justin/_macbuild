#!/usr/bin/sh

# Mac OS X bootstrap
#
# This applies my personal preferred configurations for OS X.
#
# Wes Kennedy
# wes.kennedy@gmail.com
# https://github.com/whiskykilo/macbuild
#

echo "You are about to install a bazillion apps and make a bunch of changes..."
echo "This will take a freaking eternity..."

sudo -v
###         ###
# Install Git #
###         ###
#cd /tmp
#curl https://git-osx-installer.googlecode.com/files/git-1.8.4.2-intel-universal-snow-leopard.dmg > /tmp/git.dmg
#hdiutil attach git.dmg
#cd /Volumes/Git\ 1.8.4.2\ Snow\ Leopard\ Intel\ Universal/
#sudo installer -pkg git-1.8.4.2-intel-universal-snow-leopard.pkg -target /
#hdiutil unmount /Volumes/Git\ 1.8.4.2\ Snow\ Leopard\ Intel\ Universal/

###            ###
# Setup Homebrew #
###            ###

sudo mkdir -p /usr/local
cd /usr/local
sudo mkdir homebrew
curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C homebrew


echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
brew doctor
brew update


###               ###
# Install Brew Cask #
###               ###

brew install caskroom/cask/brew-cask

###          ###
# Install wget #
###          ###

brew install wget

###              ###
# brew install git #
###              ###

brew install git

###             ###
# Configure XCode #
###             ###

xcode-select —install

###     ###
# XQuartz #
###     ###

cd /tmp
wget http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.7.dmg
hdiutil attach XQuartz-2.7.7.dmg
sudo installer -pkg /Volumes/XQuartz-2.7.7/XQuartz.pkg -target /
hdiutil unmount /Volumes/XQuartz-2.7.7

###              ###
# Clone Repository #
###              ###

cd ${HOME}

git clone https://github.com/whiskykilo/_macbuild

###                   ###
# Prep for installation #
###                   ###

chmod a+x ${HOME}/macbuild/scripts/apps.sh
chmod a+x ${HOME}/macbuild/scripts/osx.sh

###                   ###
# Install Required Apps #
###                   ###

source ${HOME}/macbuild/scripts/apps.sh

###                   ###
# Make all the changes! #
###                   ###

source ${HOME}/macbuild/scripts/osx.sh
