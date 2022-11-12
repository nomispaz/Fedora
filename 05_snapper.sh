#!/bin/bash
#snapper
sudo umount /.snapshots
sudo rm -r /.snapshots
sudo snapper -c root create-config /
sudo mount -o subvol=snapshots /dev/sdb6 /.snapshots
#sudo blkid zum heraussuchen der uuid
#wenn /.snapshots nicht schon im Installer gemountet wurden, fstab anpassen.
sudo chmod 750 /.snapshots/

#snapshots für home erlauben mit "sudo snapper -c home create-config /home"
#erzeugen von snapshots über
# sudo snapper -c root create
# sudo snapper -c home create
# snapshots mit pre und post
# sudo snapper -c root create --command "dnf upgrade -y" --description "Update"
