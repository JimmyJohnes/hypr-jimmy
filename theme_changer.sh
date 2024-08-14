changeTheme() {
	if [[ $1 == "" ]] || [[ $1 == "-h" ]]; then
		echo "Jimmy's theme changing command"
		echo "-h shows this menu"
		echo "available themes"
		ls ~/.configs/
		return
	fi
	if [ ! -d ~/.configs/$1 ]; then
		echo "Theme doesn't exist, please select one of these"
		ls ~/.configs/
		return
	fi
	pkill waybar
	pkill hyprpaper
	ln -sf ~/.configs/$1/hypr ~/.config/
	ln -sf ~/.configs/$1/kitty ~/.config/
	ln -sf ~/.configs/$1/waybar ~/.config/
	ln -sf ~/.configs/$1/wlogout ~/.config/
	ln -sf ~/.configs/$1/wofi ~/.config/
	ln -sf ~/.configs/$1/neofetch ~/.config/
	ln -sf ~/.configs/$1/.swaylock ~/
	waybar & disown
	hyprpaper & disown
	clear
	echo changed theme to $1
}

