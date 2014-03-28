#!/bin/bash

# Uninstall virtualbox guest additions
dpkg-query -W --showformat='${Package}\n' | grep virtualbox | xargs apt-get -y --purge remove


# Install virtualbox guest additions
apt-get -y install dkms
mount -o loop VBoxGuestAdditions.iso /mnt
/mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions.iso
