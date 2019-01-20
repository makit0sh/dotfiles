#!/bin/sh

PACKAGES="language-pack-ja manpages-ja manpages-ja-dev build-essential cmake python3-dev vim-gtk ctags zsh tmux x11-apps x11-utils x11-xserver-utils dbus-x11 texlive-full"

sudo apt update
sudo apt upgrade -y
sudo apt install -y $PACKAGES
