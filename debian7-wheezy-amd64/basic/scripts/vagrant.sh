#!/bin/bash

# Install vagrant ssh key
mkdir ~/.ssh
cd ~/.ssh
wget --no-check-certificate "https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub" -O authorized_keys
chown -R vagrant. ~/.ssh
chmod 600 authorized_keys
