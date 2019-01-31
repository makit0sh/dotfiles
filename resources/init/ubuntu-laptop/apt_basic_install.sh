#!/bin/sh

PACKAGES="build-essential git cmake python3-dev vim-gtk ctags zsh tmux texlive-full zathura"

sudo apt update
sudo apt upgrade -y
sudo apt install -y $PACKAGES
