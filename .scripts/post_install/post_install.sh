#!/bin/bash
# Installation script for base Arch installation
# Scripts run after arch-chrooting into the new installation

# Install Customized Package List
./install_packages.sh

# Get .config files and impl
# git clone https://github.com/teddywaweru/dotfiles.git

# AOB
# mouse to move to center of window when swapping in i3
./move_mouse.sh
