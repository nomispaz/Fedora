#!/bin/bash
#activate gnome-extensions
sudo dnf -y install gnome-shell-extension-pop-shell gnome-shell-extension-appindicator

gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com

#pop-shell settings
gnome-extensions enable pop-shell@system76.com
gsettings set org.gnome.shell.extensions.pop-shell gap-inner 'uint32 2'
gsettings set org.gnome.shell.extensions.pop-shell gap-outer 'uint32 1'
gsettings set org.gnome.shell.extensions.pop-shell show-title false
gsettings set org.gnome.shell.extensions.pop-shell active-hint true
gsettings set org.gnome.shell.extensions.pop-shell hint-color-rgba 'rgb(212,117,34
