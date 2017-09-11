#!/bin/bash

echo MacTex setup start

if has "tlmgr"; then
    echo update by tlmgr
    #tlmgr update --self
fi

echo "$(tput setaf 2)MacTex setup complete ✔︎$(tput sgr0)"
