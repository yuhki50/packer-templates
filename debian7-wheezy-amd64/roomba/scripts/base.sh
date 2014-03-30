#!/bin/bash

# Update system
apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y clean


# Setup sudo
sed -e 's/\(%sudo\s\).\+$/\1ALL=(ALL:ALL) NOPASSWD:ALL/' -i /etc/sudoers


# grub
sed -e 's/\(GRUB_TIMEOUT\).\+$/\1=5/' -i /etc/default/grub
update-grub
