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
sudo dnf install -y rofi-wayland # dmenu launcher replacement used as bind SUPER + R: rofi -show drun -show-icons -matching prefix -drun-match-fields name -sort -levenshtein-sort
sudo dnf install -y hyprpaper
sudo dnf install -y wlogout # session manager to lock sleep etc..
sudo dnf install -y swaylock
sudo dnf install -y polkit-gnome

# pywal get color schemes
# pip install pywal

# configurations
# screenshot environment variable HYPRSHOT_DIR set to ~/Pictures/Screenshots in hypr.conf

# hyprpaper config (wallpaper)
cp ~/linux/configs/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
cp ~/linux/files/astro.png ~/Pictures/wallpapers/astro.png

# pywal get color schemes
# wal -i "~/Pictures/wallpapers/astro.png"

# hyprland config
cp ~/linux/configs/hypr/hyprland.conf ~/.configs/hypr/hyprland.conf

# waybar config
cp ~/linux/configs/waybar/config.jsonc ~/.config/waybar/config.jsonc
cp ~/linux/configs/waybar/style.css ~/.config/waybar/style.css

# rofi config
cp ~/linux/configs/rofi/config.rasi ~/.config/rofi/config.rasi
cp ~/linux/configs/rofi/nord.rasi ~/.local/share/rofi/themes/nord.rasi

# wlogout theme
cp ~/linux/configs/wlogout ~/.config/wlogout

# swaylock config
cp ~/linux/configs/swaylock/config ~/.swaylock/config

# polkit script
cp ~/linux/configs/polkit/script.sh ~/.config/polkit/script.sh




