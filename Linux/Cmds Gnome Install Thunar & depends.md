
echo "Making Thunar Default"
xdg-mime default thunar.desktop inode/directory application/x-gnome-saved-search
# some GNOME apps may have the "nautilus" command hard-coded. With this, "nautilus" calls "thunar")
sudo cp /usr/bin/thunar /usr/bin/nautilus

echo "Installing Thunar Addons"
# catfish: recursive search (separate app - needs custom action)
install: catfish, xfce4-terminal, file-roller, thunar-archive-plugin

echo "Enabling Thunar Photo And Video Thumbnails"
# tumbler: photo thumbs, the rest are for video thumbs
install: tumbler, gstreamer1-plugin, openh264, ffmpegthumbs, ffmpegthumbnailer,

echo "Enabling Thunar Icons In Context Menus And Buttons"
# Lxappearance is an app that installs gtk2 dependencies needed for this. You can use this GUI instead of the gsettings command below. Go to the "Other" section and enable "Show image on buttons" and "Show images in menus".
sudo dnf -yq install lxappearance
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/ButtonImages': <1>, 'Gtk/MenuImages': <1>}"
