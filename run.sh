#!/bin/bash

## Creating instalation directory ##


cd ~
mkdir "temp"
cd temp


## Removing eventual apt locks ##


sudo rm /var/lib/dpkg/lock-frontend && sudo rm /var/cache/apt/archives/lock


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

#Pop!_OS Shell
cd shell
sh rebuild.sh
cd ..

#Wine
sudo apt install --install-recommends winehq-stable -y


## Seting up the Desktop Envroiment ##


# Removing the dock (I don't like it)
cd /usr/share/gnome-shell/extensions/
sudo rm ubuntu-dock@ubuntu.com


## Restarting ##


sudo reboot -f
