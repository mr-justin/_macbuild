#!/usr/bin/env bash

# Mac OS X Office 2011 Installation
#
# Wes Kennedy
# wes.kennedy@gmail.com
# https://github.com/whiskykilo/_macbuild
#

cd /tmp
# wget your Office 2011 ISO
# make sure to change all paths below

wget https://www.dropbox.com/s/stivzz3ikmlsb46/SW_DVD5_Office_Mac_Standard_2011w_SP1_English_MLF_X17-46470.ISO?dl=0
hdiutil attach ISOname.iso
sudo installer -pkg /Volumes/ISOLocation/ -target /
hdiutil unmount /Volumes/ISOLocation
