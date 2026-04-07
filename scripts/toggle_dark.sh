#!/bin/bash

CURRENT_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme)

if [ "$CURRENT_SCHEME" = "'default'" ]; then
    # TARGET: DARK
    THEME="Colloid-Dark"
    SCHEME="prefer-dark"
else
    # TARGET: LIGHT
    THEME="Colloid-Light"
    SCHEME="default"
fi

# 1. Update GSettings (GNOME Apps)
gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
gsettings set org.gnome.desktop.interface color-scheme "$SCHEME"

export GTK_THEME="$THEME"

echo "Switched to $THEME"
