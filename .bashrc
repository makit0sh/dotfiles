# user definitions--------------
if [ "$TERM" == xterm ]; then
    export TERM=xterm-color
fi
export LS_COLORS='no=01;37:fi=00:di=01;36:ln=01;32:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;33:*core=01;31:'

alias ls='ls -G'
alias l='ls'
alias ll='ls -hl'
alias la='ls -a'
alias lla='ls -la'
alias rm='rm -i'
alias grep='grep -E --color=auto'
alias od='od -txlz -Ax -v'



