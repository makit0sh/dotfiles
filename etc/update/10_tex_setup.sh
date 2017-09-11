#!/bin/bash

has() {
  type "$1" > /dev/null 2>&1
}

echo MacTex setup start

if has "tlmgr"; then
    tlmgr update --self
fi

echo 初回インストールの際には，手動で和文フォントの設定を行ってください

echo "$(tput setaf 2)MacTex setup complete ✔︎$(tput sgr0)"
