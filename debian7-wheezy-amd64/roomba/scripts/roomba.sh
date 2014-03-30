#!/bin/bash

# Text editor
apt-get -y install vim
update-alternatives --set editor /usr/bin/vim.basic

# Git
apt-get -y install git git-flow

# Mercurial
apt-get -y install mercurial

# Subversion
apt-get -y install subversion

# Go
wget https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz -O /tmp/go.tar.gz
tar -C /usr/local -xzf /tmp/go.tar.gz
rm -rf /tmp/go.tar.gz

ln -s /usr/local/go/bin/go /usr/local/bin/go
ln -s /usr/local/go/bin/godoc /usr/local/bin/godoc
ln -s /usr/local/go/bin/gofmt /usr/local/bin/gofmt

export GOROOT=`go env GOROOT`
cd $GOROOT/src
export GOARCH=arm
./make.bash

# Ruby
wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz -O /tmp/ruby-2.1.1.tar.gz
tar -C /tmp -xzf /tmp/ruby-2.1.1.tar.gz
cd /tmp/ruby-2.1.1
./configure
make
make install
cd ~
cat << EOF >> /home/vagrant/.profile

# golang
export GOPATH=~/.golang
export PATH=$GOPATH/bin:$PATH
EOF
rm -rf /tmp/ruby-2.1.1*

# Python
apt-get -y install python3
update-alternatives --install /usr/bin/python python /usr/bin/python3.2 10

# Terminal multiplexer
apt-get -y install screen
apt-get -y install tmux

# FTDI
apt-get -y install libftdi1

