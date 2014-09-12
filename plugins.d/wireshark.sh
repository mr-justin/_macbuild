###                 ###
# Wireshark with GTK3 #
###                 ###
brew install hub
cd $(brew --repository)
hub pull https://github.com/rbalint/homebrew-gtk-quartz

brew link --overwrite gsettings-desktop-schemas
brew install --build-from-source at-spi2-core at-spi2-atk cairo harfbuzz pango gtk+3 gtk+ librsvg gnome-themes-standard wireshark --without-x --without-x11 --with-gtk+3

cd ${HOME}

mkdir -p .config/gtk-3.0
echo "[Settings]" > .config/gtk-3.0/settings.ini
echo "gtk-theme-name = Adwaita" >> .config/gtk-3.0/settings.ini
