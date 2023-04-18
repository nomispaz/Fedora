#!/bin/bash
#set hostname
sudo hostnamectl set-hostname XMGneo15Fedora
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

#activate rpm fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#add rawhide repo from opensuse buildservice for zsh-history-substring-search
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:zsh-users:zsh-history-substring-search/Fedora_Rawhide/shells:zsh-users:zsh-history-substring-search.repo

#add personal repo
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:nomispaz/Fedora_37/home:nomispaz.repo

sudo firewall-cmd --set-default-zone block

#enable wayland in different programs
mkdir -p ~/.config/environment.d/
echo "MOZ_ENABLE_WAYLAND=1" >> ~/.config/environment.d/envvars.conf

sudo dnf install -y obs-studio calibre clipgrab clamav clamav-update snapper python3-dnf-plugin-snapper thunderbird keepassxc discord vlc util-linux-user virt-manager make gcc dkms kernel-devel chromium screenfetch tuxedo-keyboard tuxedo-control-centersteam gamemode mangohud akmod-nvidia xorg-x11-drv-nvidia-cuda zsh zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search veracrypt looking-glass

# swap mesa-video drivers to freeworld so that e.g. h264 codecs are still supported
# sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
# sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
#sudo dnf install -y lutris libretro-mgba

sudo systemctl start libvirtd
sudo systemctl enable libvirtd

sudo freshclam

#install tuxedo-keyboard und tuxedo-control-center
git clone https://github.com/nomispaz/tuxedo-installer.git ~/git_clones/tuxedo-installer
cd ~/git_clones/tuxedo-installer
chmod +x install_tuxedo_fedora.sh
./install_tuxedo_fedora.sh

# configure snapper
#sudo snapper -c root create-config /
#read UUID of rootpartition and write into variable
#rootUUID=$(cat /etc/fstab | sed -nE 's/.*UUID=(.*)+ \/.*+root.*$/\1/p')
#sudo mount UUID=$rootUUID /.snapshots
#echo "UUID=$rootUUID /.smapshots btrfs subvol=snapshots,compress=zstd:1 0 0" | sudo tee -a /etc/fstab
#sudo chmod 750 /.snapshots/
