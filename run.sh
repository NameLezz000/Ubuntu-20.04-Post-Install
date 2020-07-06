#!/bin/bash

## Creating instalation directory ##
cd ~
mkdir "temp"
cd temp

## Seting up the Desktop Envroiment ##
# Removing the dock (I don't like it)
cd /usr/share/gnome-shell/extensions/
sudo rm ubuntu-dock@ubuntu.com

## Removing eventual apt locks ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Updating repository ##
sudo dpkg --add-architecture i386
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' 
sudo apt update

## Installing tools ##
sudo apt install git make node-typescript -y

## Downloading packages ##
git clone https://github.com/pop-os/shell.git
wget -c "https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb"
wget -c "https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.16851_amd64.deb"
cd .. && git clone https://github.com/000-NameLezz/Default-School-Programs.git && cd temp

## Installing packages ##

#Discord
sudo apt install ./discord*.deb -y

#MS Teams
sudo apt install ./teams*.deb -y

#Wine
sudo apt install --install-recommends winehq-stable -y

#Pop!_OS Shell
cd shell
# Build and install extension
make all
make install
left="h"
down="j"
up="k"
right="l"
KEYS_GNOME_WM=/org/gnome/desktop/wm/keybindings
KEYS_GNOME_SHELL=/org/gnome/shell/keybindings
KEYS_MUTTER=/org/gnome/mutter/keybindings
KEYS_MEDIA=/org/gnome/settings-daemon/plugins/media-keys
dconf write /org/gnome/mutter/wayland/keybindings/restore-shortcuts "@as []"
dconf write ${KEYS_GNOME_WM}/minimize "@as ['<Super>comma']"
dconf write ${KEYS_GNOME_SHELL}/open-application-menu "@as []"
dconf write ${KEYS_GNOME_SHELL}/toggle-message-tray "@as ['<Super>v']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-left "@as []"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-right "@as []"
dconf write ${KEYS_GNOME_WM}/move-to-monitor-up "@as []"
dconf write ${KEYS_GNOME_WM}/move-to-monitor-down "@as []"
dconf write ${KEYS_GNOME_WM}/move-to-monitor-left "['<Shift><Super>Left','<Shift><Super>${left}']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-down "['<Shift><Super>Down','<Shift><Super>${down}']"
dconf write ${KEYS_GNOME_WM}/move-to-workspace-up "['<Shift><Super>Up','<Shift><Super>${up}']"
dconf write ${KEYS_GNOME_WM}/move-to-monitor-right "['<Shift><Super>Right','<Shift><Super>${right}']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-down "['<Primary><Super>Down','<Primary><Super>${down}']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-up "['<Primary><Super>Up','<Primary><Super>${up}']"
dconf write ${KEYS_MUTTER}/toggle-tiled-left "@as []"
dconf write ${KEYS_MUTTER}/toggle-tiled-right "@as []"
dconf write ${KEYS_GNOME_WM}/toggle-maximized "['<Super>m']"
dconf write ${KEYS_MEDIA}/screensaver "['<Super>Escape']"
dconf write ${KEYS_MEDIA}/home "['<Super>f']"
dconf write ${KEYS_MEDIA}/email "['<Super>e']"
dconf write ${KEYS_MEDIA}/www "['<Super>b']"
dconf write ${KEYS_MEDIA}/rotate-video-lock-static "@as []"
dconf write ${KEYS_GNOME_WM}/close "['<Super>q']"
Use a window placement behavior which works better for tiling
gnome-extensions enable native-window-placement
make enable
make restart-shell
make listen
cd ..
