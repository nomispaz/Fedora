#!/bin/bash
#keyboard backlight
git clone https://github.com/tuxedocomputers/tuxedo-keyboard.git ~/git_clones/tuxedo-keyboard
cd ~/git_clones/tuxedo-keyboard
git checkout release
make clean
sudo make dkmsinstall
sudo modprobe tuxedo_keyboard
