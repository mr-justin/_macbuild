echo "Installing XQuartz"
cd /tmp
wget http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.7.dmg
hdiutil attach XQuartz-2.7.7.dmg
sudo installer -pkg /Volumes/XQuartz-2.7.7/XQuartz.pkg -target /
hdiutil unmount /Volumes/XQuartz-2.7.7
