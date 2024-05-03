#!/bin/bash

echo "byrybdyk's dotfiles"

read -n1 -rep "Would you like to install required packages? (y,n)" INST
if [[ $INST == "Y" || $INST == "y" ]]; then
  dnf -y corp enable solopasha/hyprland \
  dnf -y copr enable maveonair/jetbrains-mono-nerd-font \
  dnf -y copr enable erikreider/SwayNotificationCenter \

  dnf -y install hyprland kitty waybar \
    wofi cava hypridle hyprlock wlogout Thunar \
    jetbrains-mono-nerd-fonts google-noto-color-emoji-fonts \
    polkit-gnome python-requests starship \
    swappy grim slurp pamixer brightnessctl gvfs \
    bluez bluez-tools neofetch neovim SwayNotificationCenter \
    xdg-desktop-portal-hyprland sddm blueman \
    nm-connection-editor wl-clipboard swaybg \

  dnf clean all

  echo "Packages have been installed!"
fi

read -n1 -rep "Would you like to copy config files? (y,n)" CFG
if [[ $CFG == "Y" || $CFG == "y" ]]; then
  cp -R cava ~/.config/
  cp -R hypr ~/.config/
  cp -R kitty ~/.config/
  cp -R neofetch ~/.config/
  cp -R nvim ~/.config/
  cp -R swaync ~/.config/
  cp -R waybar ~/.config/
  cp -R swaylock ~/.config/
  cp -R wofi ~/.config/

  cp starship.toml ~/.config/

  cp -R Pictures ~/

  chmod +x ~/.config/hypr/xdg-portal-hyprland
  chmod +x ~/.config/waybar/mediaplayer.py
fi


echo -e "Installation has succesfully finished.\n"
read -n1 -rep "Would you like to start Hyprland now? (y,n)" HYP
if [[ $HYP == "Y" || $HYP == "y" ]]; then
  exec Hyprland
else
  exit
fi
