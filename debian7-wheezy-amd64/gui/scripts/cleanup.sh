#!/bin/bash

# Clean up package
apt-get -y autoremove
apt-get -y clean


# Zero out the free space to save space in the final image
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
