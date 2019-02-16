#    PERSONAL SETTINGS    #
###########################

echo "################################################################"
echo "###################    NAUTILUS SETTINGS  ######################"
echo "################################################################"
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gtk.Settings.FileChooser show-hidden false 

echo "################################################################"
echo "###################    SLINGSHOT SETTINGS  ######################"
echo "################################################################"
gsettings set io.elementary.desktop.wingpanel.applications-menu columns 7 && gsettings set io.elementary.desktop.wingpanel.applications-menu rows 6
gsettings set org.gnome.mutter overlay-key "'Super_L'"
gsettings set org.pantheon.desktop.gala.behavior overlay-action "'wingpanel --toggle-indicator=app-launcher'"

echo "################################################################"d
echo "###################    MINIMIZE WINDOW HOTKEY  ######################"
echo "################################################################"
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super>d']"

echo "################################################################"
echo "###################    ICONS   ######################"
echo "################################################################"
mkdir ~/.local/share/icons/ && cp -R "Files/Icons Packs/." ~/.local/share/icons
mkdir ~/Imágenes/Iconos && cp -R "Files/Icons/." ~/Imágenes/Iconos

echo "################################################################"
echo "###################    THEME   ######################"
echo "################################################################"
cp -R Files/Theme/. ~/.themes
gsettings set org.gnome.desktop.interface gtk-theme "Ant"
gsettings set org.pantheon.desktop.gala.appearance button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.interface icon-theme 'Paper2'

echo "################################################################"
echo "###################    WALLPAPERS   ######################"
echo "################################################################"
cp -a ~/Imágenes/Wallpapers/. ~/.local/share/backgrounds/
echo '\n' >> ~/.bashrc
sed -i -e '$a\' ~/.bashrc
echo "alias walls='rm -r ~/.local/share/backgrounds/*; cp -a ~/Imágenes/Wallpapers/. ~/.local/share/backgrounds/; find ~/.local/share/backgrounds/ -type f -exec chmod 644 {} \;'" >> ~/.bashrc
source ~/.bashrc

echo "################################################################"
echo "###################    DESKTOPS FILES   ######################"
echo "################################################################"
cp -a Files/Desktops/. ~/.local/share/applications/

echo "################################################################"
echo "###################    VIDEO PRIME ALIAS   ######################"
echo "################################################################"
echo "alias intel='sudo -S <<< "PASS" sudo prime-select intel && sudo systemctl reboot -i'" >> ~/.bashrc
echo "alias nvidia='sudo -S <<< "PASS" sudo apt-get install nvidia-driver-410 --reinstall && sudo prime-select nvidia &&  sudo systemctl reboot -i'" >> ~/.bashrc
echo "alias query='prime-select query'" >> ~/.bashrc
source ~/.bashrc


echo "################################################################"
echo "###################    DLNA ALIAS   ######################"
echo "################################################################"
echo "alias dlna='sudo -S <<< "PASS" pulseaudio-dlna --encoder wav'" >> ~/.bashrc
source ~/.bashrc

echo "################################################################"
echo "###################    AIRPLAY    ######################"
echo "################################################################"
cp -a Files/AirPlay/toggle.sh ~/.toggle.sh
chmod +x ~/.toggle.sh
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'AirPlay'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Ctrl><Shift>A'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'/bin/sh /home/gonzalo/.toggle.sh'"

echo "################################################################"
echo "###################    MEDIA HOTKEYS     ######################"
echo "################################################################"
gsettings set org.gnome.settings-daemon.plugins.media-keys play '<Primary><Shift>space'
gsettings set org.gnome.settings-daemon.plugins.media-keys next '<Primary><Shift>Right'
gsettings set org.gnome.settings-daemon.plugins.media-keys previous '<Primary><Shift>Left'

echo "################################################################"
echo "###################    HOME FOLDER   ######################"
echo "################################################################"
echo 'XDG_DESKTOP_DIR="$HOME/.config/desktop"' >> ~/.config/user-dirs.dirs
echo 'enabled=False' >> ~/.config/user-dirs.dirs

echo "################################################################"
echo "###################    NATURAL SCROLL DISABLE   ######################"
echo "################################################################"
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false

echo "################################################################"
echo "###################    DISABLE SOUND EFFECTS ######################"
echo "################################################################"
gsettings set org.gnome.desktop.sound event-sounds false
cp -a Files/Sounds/. ~/.local/share/sounds/

echo "################################################################"
echo "###################  WING PANEL  ######################"
echo "################################################################"

sudo bash -c "echo 'vlc' >> /etc/wingpanel.d/ayatana.blacklist"
sudo bash -c "echo 'steam' >> /etc/wingpanel.d/ayatana.blacklist"
sudo bash -c "echo 'Skype1' >> /etc/wingpanel.d/ayatana.blacklist"
sudo bash -c "echo 'Google Play Music Desktop Player1' >> /etc/wingpanel.d/ayatana.blacklist"
sudo bash -c "echo 'zoom' >> /etc/wingpanel.d/ayatana.blacklist"

# HIDE DATE
gsettings set io.elementary.desktop.wingpanel.datetime clock-show-date false

#FIND wich applications use indicators
#dbus-send --type=method_call --print-reply --dest=com.canonical.indicator.application /com/canonical/indicator/application/service com.canonical.indicator.application.service.GetApplications | grep "object path"
