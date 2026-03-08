#!/usr/bin/env bash

# Get current GNOME color scheme
current=$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")

if [ "$current" = "default" ]; then
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
    echo "Switched to dark mode."
elif [ "$current" = "prefer-dark" ]; then
    gsettings set org.gnome.desktop.interface color-scheme default
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita
    echo "Switched to light mode."
else
    echo "Unknown color scheme: $current"
fi
