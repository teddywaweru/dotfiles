#!/bin/bash
# Installation script for base Arch installation
# Scripts run prior to arch-chrooting into the new installation
# Assumes that the partition to be used in the installation is 
# mounted at /mnt,
# while the efi partition is mounted at /efi



# INSTALL PACKAGES
# Install Linux Kernel 
pacstrap -K /mnt base linux linux-firmware 
#
# Generate an fstab
genfstab -U /mnt >> /mnt/etc/fstab
#
# Do AUR mirror things
#
# Create a swap partition and mount


# AOB

