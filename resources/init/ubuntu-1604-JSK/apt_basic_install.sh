#!/bin/sh

PACKAGES="curl build-essential git cmake python3-dev vim-gtk ctags zsh tmux xsel zathura libgnome-keyring0 texlive-full nautilus-dropbox gnome-tweak-tool ranger w3m lynx highlight atool mediainfo xpdf caca-utils"

sudo apt update
sudo apt upgrade -y
sudo apt install -y $PACKAGES
