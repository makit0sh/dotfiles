#!/bin/sh
if [ -d .zplug ]; then
  echo "~/.zplug already exists"
else
  echo "creating ~/.zplug"
  mkdir -p ~/.zplug
fi
chmod -R 755 ~/.zplug
