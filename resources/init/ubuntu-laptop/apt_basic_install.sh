#!/bin/sh

PACKAGES="build-essential git cmake python3-dev vim-gtk ctags zsh tmux zathura libgnome-keyring0"

sudo apt update
sudo apt upgrade -y
sudo apt install -y $PACKAGES
