#!/bin/bash

declare -A osInfo
osInfo[/etc/arch-release]=yay
osInfo[/etc/fedora-release]=dnf
osInfo[/etc/debian_version]=apt-get


for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        echo Package manager: ${osInfo[$f]}
	echo "removing dependencies"
	if [[ ${osInfo[$f]} == "dnf" ]];then
		sudo dnf remove thunar swaybg hyprland waybar wofi wlogout swaylock SwayNotificationCenter pavucontrol kitty
	fi
	if [[ ${osInfo[$f]} == "yay" ]];then
		yay -R hyprland wofi swaync waybar wlogout swaylock swaybg kitty thunar xwaylandvideobridge
	fi
	if [[ ${osInfo[$f]} == "apt-get" ]];then
		sudo apt-get remove -y meson wget build-essential ninja-build cmake-extras cmake gettext gettext-base fontconfig libfontconfig-dev libffi-dev libxml2-dev libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev libxkbcommon-dev libpixman-1-dev libudev-dev libseat-dev seatd libxcb-dri3-dev libegl-dev libgles2 libegl1-mesa-dev glslang-tools libinput-bin libinput-dev libxcb-composite0-dev libavutil-dev libavcodec-dev libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-present-dev libxcb-icccm4-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-xinput-dev xdg-desktop-portal-wlr libtomlplusplus3 sway-notification-center thunar wlogout wofi swaylock waybar swaybg kitty brightnessctl pamixer pavucontrol
	fi
    fi
done




if [ -d $HOME/.config/hypr ]
then
	echo "removing Hyprland config"
	rm -r ./hypr/ $HOME/.config/hypr
fi

if [ -d $HOME/.config/wofi ]
then
	echo "removing wofi config"
	rm -r $HOME/.config/wofi
fi

if [ -d $HOME/.config/kitty ]
then
	echo "kitty config exists!"
	rm -r $HOME/.config/kitty
fi

if [ -d $HOME/.swaylock ]
then
	echo "swaylock config exists!"
	rm -r $HOME/.swaylock
	(( configNumber = configNumber + 1))
fi

if [ -d $HOME/.config/waybar ]
then
	echo "waybar config exists!"
	rm -r $HOME/.config/waybar
fi

if [ -d $HOME/.config/wlogout ]
then
	echo "wlogout config exists!"
	rm -r $HOME/.config/wlogout
fi
if [ -d ~/.wallpapers ]
then
	echo "Removing wallpapers folder"
	rm -r ~/.wallpapers
fi
