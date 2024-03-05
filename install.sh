#!/bin/bash

configNumber=0 configsToExits=6
declare -A osInfo
osInfo[/etc/arch-release]=yay
osInfo[/etc/fedora-release]=dnf


for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        echo Package manager: ${osInfo[$f]}
	if [[ ${osInfo[$f]} == "dnf" ]];then
		sudo dnf copr enable erikreider/SwayNotificationCenter
		sudo dnf install swaybg hyprland waybar wofi wlogout swaylock SwayNotificationCenter pavucontrol kitty
	fi
    fi
done




if [ -d ./hypr ]
then
	echo "Hyprland config exists!"
	cp ./hypr $HOME/.config/hypr
	(( configNumber = configNumber + 1))
fi

if [ -d ./wofi ]
then
	echo "wofi config exists!"
	cp ./wofi $HOME/.config/wofi
	(( configNumber = configNumber + 1))
fi

if [ -d ./kitty ]
then
	echo "kitty config exists!"
	cp ./kitty $HOME/.config/kitty
	(( configNumber = configNumber + 1))
fi

if [ -d ./swaylock ]
then
	echo "swaylock config exists!"
	cp ./swaylock $HOME/.config/swaylock
	(( configNumber = configNumber + 1))
fi

if [ -d ./waybar ]
then
	echo "waybar config exists!"
	cp ./waybar $HOME/.config/waybar
	(( configNumber = configNumber + 1))
fi

if [ -d ./wlogout ]
then
	echo "wlogout config exists!"
	cp ./wlogout $HOME/.wlogout
	(( configNumber = configNumber + 1))
fi

if [ $configNumber -eq $configsToExits ]
then
	echo "Found all needed configs!"
fi

if [ -d ./wallpapers ]
then
	echo "Wallpapers folder found!"
	cp .wallpapers ~/.wallpapers
