#!/bin/bash


# STEP 1: installing required packages 
# assumes yay is installed, if not, please install yay from the AUR

yay -S nautilus hyprland wofi swaync waybar wlogout hyprlock hyprpaper kitty xwaylandvideobridge deepin-polkit-agent

if [ -d ./hypr ]
then
	echo "Hyprland config exists!"
	cp -r ./hypr/ $HOME/.config/hypr
fi

if [ -d ./wofi ]
then
	echo "wofi config exists!"
	cp -r ./wofi/ $HOME/.config/wofi
fi

if [ -d ./kitty ]
then
	echo "kitty config exists!"
	cp -r ./kitty/ $HOME/.config/kitty
fi

if [ -d ./swaylock ]
then
	echo "swaylock config exists!"
	cp -r ./swaylock/ $HOME/.swaylock
fi

if [ -d ./waybar ]
then
	echo "waybar config exists!"
	cp -r ./waybar/ $HOME/.config/waybar
fi

if [ -d ./wallpapers ]
then
	echo "Wallpapers folder found!"
	cp -r ./wallpapers ~/.wallpapers
fi
