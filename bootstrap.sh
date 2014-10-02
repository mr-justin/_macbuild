#!/usr/bin/env bash
################################################################################
# Mac OS X Bootstrap that mac                                                  #
#                                                                              #
# Wes Kennedy                                                                  #
# wes@whiskykilo.com                                                           #
# https://github.com/whiskykilo/_macbuild                                      #
# http://whiskykilo.com                                                        #
#                                                                              #
################################################################################
#                    Choose the apps you want to install                       #
################################################################################

brewApps (
  ack
  ansible
  atk
  bash-completion
  c-ares
  ccache
  d-bus
  fontconfig
  freetype
  gettext
  geoip
  git
  glib
  gmp
  gnutls
  gsettings-desktop-schemas
  hicolor-icon-theme
  icu4c
  libffi
  libgcrypt
  libpng
  libtasn1
  libtiff
  lua
  mtr
  nmap
  node
  pixman
  pkg-config
  portaudio
  shellcheck
  wget
  xz
)

brewCaskApps (
  atom
  bartender
  bittorrent-sync
  caffeine
  carbon-copy-cloner
  crashplan
  dropbox
  evernote
  flux
  google-chrome
  hipchat
  istat-menus
  iterm2
  little-snitch
  macvim
  onepassword
  spotify
  vagrant
  virtualbox
  vmware-fusion
)

echo "........................................................................."
echo ". You are about to install a bazillion apps and make a bunch of changes ."
echo ". This will take a freaking eternity (over an hour)                     ."
echo ". No really, I'm not kidding                                            ."
echo "........................................................................."

echo "Gotta get your admin creds, just this time, I swear."

sudo -v

################################################################################
# Installing XCode Tools - This will require manual intervention.              #
################################################################################

echo "Installing XCode Command Line Tools, this is required to continue."
xcode-select --install

while [ ! -d /Library/Developer/CommandLineTools ]
do
  sleep 2
done

sleep 45

echo "........................................................................."

################################################################################
# Installing Homebrew                                                          #
################################################################################

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

echo "........................................................................."

################################################################################
# Update core unix tools                                                       #
################################################################################

brew install coreutils
brew install findutils
brew install bash
brew tap homebrew/dupes
brew install homebrew/dupes/grep

$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

echo "........................................................................."

################################################################################
# Install Brew Cask                                                            #
################################################################################

echo "Installing Brew Cask"

brew install caskroom/cask/brew-cask

echo "........................................................................."

################################################################################
# Install Brew Apps                                                            #
################################################################################


brew install ${brewApps[@]}
brew cask install --appdir="/Applications" ${brewCaskApps[@]}
brew cleanup

echo "........................................................................."

################################################################################
# Clone the repo                                                               #
################################################################################

echo "Pulling down the most recent _macbuild repo"

cd ${HOME}

git clone https://github.com/whiskykilo/_macbuild

echo "........................................................................."

################################################################################
# Put the dotfiles in place                                                    #
################################################################################

echo "Moving dotfiles into place"

rm ${HOME}/.bash_profile
cp ${HOME}/_macbuild/dotfiles/.bash_profile ${HOME}/
mkdir ${HOME}/.ssh
cp ${HOME}/_macbuild/dotfiles/ssh/config ${HOME}/.ssh/

echo "........................................................................."

################################################################################
# Install misc apps                                                            #
################################################################################

source ../plugins.d/xquartz.sh
source ../plugins.d/wireshark.sh
source ../plugins.d/githubmac.sh

chmod a+x ${HOME}/_macbuild/scripts/osx.sh

source ${HOME}/_macbuild/scripts/osx.sh

chmod a+x ${HOME}/_macbuild/plugins.d/*.sh

pip install mackup

echo "........................................................................."

################################################################################
# Update bash_profile                                                          #
################################################################################

cat <<EOT >> ~/.bash_profile
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
EOT
else
  echo "bash-completion is installed"
fi

echo "........................................................................."

################################################################################
# All done                                                                     #
################################################################################

echo "........................................................................."
echo ". Ok, we're all finished now. I would suggest rebooting your computer   ."
echo ". because we've made a lot of changes to the working environment.       ."
echo ". If you have any issues, please let me know!                           ."
echo ".                                                                       ."
echo ". Once your computer reboots, please perform the following steps:       ."
echo ".                                                                       ."
echo ". 1- Setup your Dropbox                                                 ."
echo ". 2- Run `mackup backup` from the terminal                              ."
echo ". 3- Enjoy                                                              ."
echo "........................................................................."

# TODO Insert reboot prompt.
