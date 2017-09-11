#!/bin/bash

echo start setup macvim
if [ ! -d ${HOME}/.vim ]; then
    mkdir ${HOME}/.vim
fi
if [ ! -d ${HOME}/.vim/backup ]; then
    mkdir ${HOME}/.vim/backup
fi
if [ ! -d ${HOME}/.vim/swp ]; then
    mkdir ${HOME}/.vim
fi
if [ ! -d ${HOME}/.vim/undo ]; then
    mkdir ${HOME}/.vim/undo
fi

echo "$(tput setaf 2)macvim setup complete ✔︎$(tput sgr0)"
