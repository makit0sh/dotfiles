#!/bin/bash
has() {
  type "$1" > /dev/null 2>&1
}
run() {
if has "brew"; then
    echo "$(tput setaf 2)Already installed Homebrew ✔︎$(tput sgr0)"
else
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if has "brew"; then
    echo "Updating Homebrew..."
    brew update && brew upgrade
    [[ $? ]] && echo "$(tput setaf 2)Update Homebrew complete. ✔︎$(tput sgr0)"

    brew tap 'caskroom/cask'
    brew tap 'sanemat/font'

    local list_formulae
    local -a missing_formulae
    local -a desired_formulae=(
    'coreutils'
    'git'
    'go'
    'imagemagick'
    'lua'
    'ruby-build'
    'rbenv'
    'pyenv'
    'tmux'
    'zsh'
    'macvim --with-lua --with-luajit --with-override-system-vim'
    )

    local installed=`brew list`

    # desired_formulaeで指定していて、インストールされていないものだけ入れましょ
    for index in ${!desired_formulae[*]}
    do
        local formula=`echo ${desired_formulae[$index]} | cut -d' ' -f 1`
        if [[ -z `echo "${installed}" | grep "^${formula}$"` ]]; then
            missing_formulae=("${missing_formulae[@]}" "${desired_formulae[$index]}")
        else
            echo "Installed ${formula}"
            [[ "${formula}" = "ricty" ]] && local installed_ricty=true
        fi
    done

    if [[ "$missing_formulae" ]]; then
        list_formulae=$( printf "%s " "${missing_formulae[@]}" )

        echo "Installing missing Homebrew formulae..."
        brew install $list_formulae

        [[ $? ]] && echo "$(tput setaf 2)Installed missing formulae ✔︎$(tput sgr0)"
    fi

    local -a missing_formulae=()
    local -a desired_formulae=(
        'mactex'
    )
    # cask
    local installed=`brew cask list`

    for index in ${!desired_formulae[*]}
    do
        local formula=`echo ${desired_formulae[$index]} | cut -d' ' -f 1`
        if [[ -z `echo "${installed}" | grep "^${formula}$"` ]]; then
            missing_formulae=("${missing_formulae[@]}" "${desired_formulae[$index]}")
        else
            echo "Installed ${formula}"
        fi
    done

    if [[ "$missing_formulae" ]]; then
        list_formulae=$( printf "%s " "${missing_formulae[@]}" )

        echo "Installing missing Homebrew formulae..."
        brew cask install $list_formulae

        [[ $? ]] && echo "$(tput setaf 2)Installed missing formulae ✔︎$(tput sgr0)"
    fi

    echo "Cleanup Homebrew..."
    brew cleanup
    echo "$(tput setaf 2)Cleanup Homebrew complete. ✔︎$(tput sgr0)"
fi
}

run
