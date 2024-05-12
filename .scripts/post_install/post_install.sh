#!/bin/bash
# Installation script for base Arch installation
# Scripts run after arch-chrooting into the new installation

# Install Customized Package List
./install_packages.sh

# Set zsh as default shell
sudo chsh -s $(which zsh)


# AOB
# mouse to move to center of window when swapping in i3
../move_mouse.sh
