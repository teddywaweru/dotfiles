#!/bin/bash
# Installation script for base Arch installation
# Scripts run after arch-chrooting into the new installation

# Install Customized Package List
./install_packages.sh

# Get .config files 
git clone https://github.com/teddywaweru/dotfiles.git ~/.config/

# Copy .zshrc file to proper location
cp ~/.config/zsh/.zshrc ~

# AOB
