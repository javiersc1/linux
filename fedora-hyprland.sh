#!/bin/bash

# enable copr repo for now, work ongoing to get most packages on fedora main
sudo dnf copr enable -y solopasha/hyprland 

# install base hyprland
sudo dnf install -y hyprland

# hyprland packages
sudo dnf install -y alacritty # terminal emulator used as bind SUPER + ENTER: alacritty
sudo dnf install -y hyprshot # screenshots can be used as bind PRINT: hyprshot -m region
sudo dnf install -y gammastep # night light program used as exec once: gammastep -l 42.3:-83.7 -t 6500:2700 # note: -l is for lat/lon positition of major city and -t is DAY:NIGHT color temps
sudo dnf install -y waybar # bar with system info used as exec once: waybar
sudo dnf install -y dunst # notification system used as exec once: dunst
sudo dnf install -y clipman # clipboard manager used as exec once: wl-paste -t text --watch clipman store --no-persist
sudo dnf install -y rofi # dmenu launcher replacement used as bind SUPER + R: rofi -show drun -show-icons
sudo dnf install -y hyprpaper

# configurations
# screenshot environment variable HYPRSHOT_DIR set to ~/Pictures/Screenshots in hypr.conf

# wallpaper config
cp ~/linux/configs/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
cp ~/linux/files/astro.png ~/Pictures/wallpapers/astro.png

# hyprland config
cp ~/linux/configs/hypr/hyprland.conf ~/.configs/hypr/hyprland.conf

# waybar config
cp ~/linux/configs/waybar/config.jsonc ~/.config/waybar/config.jsonc
cp ~/linux/configs/waybar/style.css ~/.config/waybar/style.css



