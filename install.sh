#!/bin/bash

configNumber=0 configsToExits=6
declare -A osInfo
osInfo[/etc/arch-release]=yay
osInfo[/etc/fedora-release]=dnf
osInfo[/etc/debian_version]=apt-get


for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        echo Package manager: ${osInfo[$f]}
	echo "installing dependencies"
	if [[ ${osInfo[$f]} == "dnf" ]];then
		sudo dnf copr enable erikreider/SwayNotificationCenter
		sudo dnf install thunar swaybg hyprland waybar wofi wlogout swaylock SwayNotificationCenter pavucontrol kitty
	fi
	if [[ ${osInfo[$f]} == "yay" ]];then
		yay -S hyprland wofi swaync waybar wlogout swaylock swaybg kitty thunar xwaylandvideobridge
	fi
	if [[ ${osInfo[$f]} == "apt-get" ]];then
		sudo apt-get install -y meson wget build-essential ninja-build cmake-extras cmake gettext gettext-base fontconfig libfontconfig-dev libffi-dev libxml2-dev libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev libxkbcommon-dev libpixman-1-dev libudev-dev libseat-dev seatd libxcb-dri3-dev libegl-dev libgles2 libegl1-mesa-dev glslang-tools libinput-bin libinput-dev libxcb-composite0-dev libavutil-dev libavcodec-dev libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-present-dev libxcb-icccm4-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-xinput-dev xdg-desktop-portal-wlr libtomlplusplus3 sway-notification-center thunar wlogout wofi swaylock waybar swaybg kitty brightnessctl pamixer pavucontrol
	fi
    fi
done




if [ -d ./hypr ]
then
	echo "Hyprland config exists!"
	cp -r ./hypr/ $HOME/.config/hypr
	(( configNumber = configNumber + 1))
fi

if [ -d ./wofi ]
then
	echo "wofi config exists!"
	cp -r ./wofi/ $HOME/.config/wofi
	(( configNumber = configNumber + 1))
fi

if [ -d ./kitty ]
then
	echo "kitty config exists!"
	cp -r ./kitty/ $HOME/.config/kitty
	(( configNumber = configNumber + 1))
fi

if [ -d ./swaylock ]
then
	echo "swaylock config exists!"
	cp -r ./swaylock/ $HOME/.swaylock
	(( configNumber = configNumber + 1))
fi

if [ -d ./waybar ]
then
	echo "waybar config exists!"
	cp -r ./waybar/ $HOME/.config/waybar
	(( configNumber = configNumber + 1))
fi

if [ -d ./wlogout ]
then
	echo "wlogout config exists!"
	cp -r ./wlogout $HOME/.config/wlogout
	(( configNumber = configNumber + 1))
fi

if [ $configNumber -eq $configsToExits ]
then
	echo "Found all needed configs!"
fi

if [ -d ./wallpapers ]
then
	echo "Wallpapers folder found!"
	cp -r ./wallpapers ~/.wallpapers
fi
