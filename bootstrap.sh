#!/usr/bin/sh

# Mac OS X bootstrap
#
# This applies my personal preferred configurations for OS X.
#
# Wes Kennedy
# wes.kennedy@gmail.com
# https://github.com/whiskykilo/macbuild
#

echo "........................................................................."
echo ". You are about to install a bazillion apps and make a bunch of changes ."
echo ". This will take a freaking eternity (over an hour)                     ."
echo ". No really, I'm not kidding                                            ."
echo "........................................................................."

sudo -v

###                           ###
# Put default dotfiles in place #
###                           ###
echo "Moving dotfiles into place"

rm ${HOME}/.bash_profile
cp ${HOME}/_macbuild/dotfiles/.bash_profile ${HOME}/
mkdir ${HOME}/.ssh
cp ${HOME}/_macbuild/dotfiles/ssh/config ${HOME}/.ssh/

###             ###
# Configure XCode #
###             ###
echo "Installing XCode Command Line Tools"
xcode-select --install

while [ ! -d /Library/Developer/CommandLineTools ]
do
  sleep 2
done

sleep 45
###            ###
# Setup Homebrew #
###            ###

echo "Installing Homebrew"

sudo mkdir -p /usr/local
cd /usr/local
sudo chown -R ${USER}:admin /usr/local
sudo chmod -R 755 /usr/local

curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C /usr/local

echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
brew doctor
brew update


###               ###
# Install Brew Cask #
###               ###

echo "Installing Brew Cask"

brew install caskroom/cask/brew-cask

###          ###
# Install wget #
###          ###
echo "Installing wget and git"
brew install wget

###              ###
# brew install git #
###              ###

brew install git

###     ###
# XQuartz #
###     ###
echo "Installing XQuartz"
cd /tmp
wget http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.7.dmg
hdiutil attach XQuartz-2.7.7.dmg
sudo installer -pkg /Volumes/XQuartz-2.7.7/XQuartz.pkg -target /
hdiutil unmount /Volumes/XQuartz-2.7.7

###              ###
# Clone Repository #
###              ###

echo "Pulling down the most recent _macbuild repo"
cd ${HOME}

git clone https://github.com/whiskykilo/_macbuild

###                   ###
# Prep for installation #
###                   ###
echo "Running apps.sh installations"
chmod a+x ${HOME}/_macbuild/scripts/apps.sh
chmod a+x ${HOME}/_macbuild/scripts/osx.sh

###                   ###
# Install Required Apps #
###                   ###

source ${HOME}/_macbuild/scripts/apps.sh

###                   ###
# Make all the changes! #
###                   ###
echo "Configuring the crap out of OS X"
source ${HOME}/_macbuild/scripts/osx.sh

###                   ###
# Build dev environment #
###                   ###
echo "Time to set up the Dev environment"
source ${HOME}/_macbuild/scripts/dev.sh
