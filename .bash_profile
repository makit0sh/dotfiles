export PATH="/usr/local/sbin:$PATH"

# user definitions--------------
if [ "$TERM" == xterm ]; then
    export TERM=xterm-color
fi
export LS_COLORS='no=01;37:fi=00:di=01;36:ln=01;32:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;33:*core=01;31:'

export PS1='[\W]\$ '

export GREP_COLOR='1;37;41'
#use macvim for vim&vi----
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
#for wine-----------------
export LC_ALL=ja_JP.UTF-8
# end of user definition------

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#microchip
export PATH="$PATH:"/Applications/microchip/xc8/v1.38/bin""

#pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
export PATH="${PYENV_ROOT}/shims:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-vertualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi;

export PATH="/usr/local/opt/gettext/bin:$PATH"
