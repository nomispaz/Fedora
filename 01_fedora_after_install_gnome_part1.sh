#!/bin/bash
#set hostname
sudo hostnamectl set-hostname XMGp507Fedora
#enable root login
sudo passwd
echo "Defaults targetpw # Ask for the password of the target user" | sudo tee -a /etc/sudoers
#change timezone
sudo timedatectl set-timezone Europe/Berlin
#enable automatic timesync
sudo timedatectl set-ntp on
#system-update
sudo dnf upgrade -y

#setup rkhunter and check for warnings
sudo dnf install -y rkhunter
sudo rkhunter --update
sudo rkhunter --propupd
#c for check q for skip keypress
sudo rkhunter -c -sk

#remove bloat
sudo dnf remove -y gnome-calendar gnome-characters cheese gnome-clocks gnome-contacts gnome-maps gnome-tour gnome-weather totem xterm gnome-software mediawriter rhythmbox gnome-abrt abrt

#activate rpm fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y clamav timeshift snapper xlsclients thunderbird keepassxc discord vlc util-linux-user
#install zsh
sudo dnf install -y zsh zsh-autosuggestions zsh-syntax-highlighting
#https://software.opensuse.org/download.html?project=shells%3Azsh-users%3Azsh-history-substring-search&package=zsh-history-substring-search
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:zsh-users:zsh-history-substring-search/Fedora_Rawhide/shells:zsh-users:zsh-history-substring-search.repo

#install additional packages gnome
sudo dnf install -y chrome-gnome-shell gnome-tweaks obs-studio calibre clipgrab clamav snapper xlsclients thunderbird keepassxc discord vlc util-linux-user zsh zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search clamav-update virt-manager make gcc dkms kernel-devel chromium

sudo firewall-cmd --set-default-zone block

#enable wayland in different programs
mkdir -p ~/.config/environment.d/
echo "MOZ_ENABLE_WAYLAND=1" >> ~/.config/environment.d/envvars.conf

#initial loading of clamav definitions
sudo freshclam

#zsh will be activated after restart or relogon
cp .zshrc ~/
#to be able to chsh
chsh -s /bin/zsh
sudo chsh -s /bin/zsh
