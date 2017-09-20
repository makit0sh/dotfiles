# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=${HISTSIZE}
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/T_Maki/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# user definitions--------------
#PATH setting
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH="$PATH:"/Applications/microchip/xc8/v1.38/bin""

#language
export LANGUAGE="ja_JP.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"

#color
#export LS_COLORS='no=01;37:fi=00:di=01;36:ln=01;32:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;33:*core=01;31:'
# ls の色付け
# アーカイブファイルは赤
# 画像・動画・音声ファイルは紫
# pdf/ps/dvi は思案
# オフィス系は緑
# README/TODO/MEMO 系はオレンジ
export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tbz2=00;31:*.tz=00;31:*.xz=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.rar=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:*.eps=00;35:*.jpg=00;35:*.JPG=00;35:*.jpeg=00;35:*.JPEG=00;35:*.gif=00;35:*.GIF=00;35:*.bmp=00;35:*.BMP=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.PNG=00;35:*.mng=00;35:*.pcx=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.m2v=00;35:*.mkv=00;35:*.ogm=00;35:*.mp4=00;35:*.m4v=00;35:*.mp4v=00;35:*.vob=00;35:*.qt=00;35:*.nuv=00;35:*.wmv=00;35:*.asf=00;35:*.rm=00;35:*.rmvb=00;35:*.flc=00;35:*.avi=00;35:*.fli=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.yuv=00;35:*.aac=00;35:*.au=00;35:*.flac=00;35:*.mid=00;35:*.midi=00;35:*.mka=00;35:*.mp3=00;35:*.mpc=00;35:*.ogg=00;35:*.ra=00;35:*.wav=00;35:*.pdf=00;36:*.ps=00;36:*.dvi=00;36:*.doc=00;32:*.docx=00;32:*.xls=00;32:*.xlsx=00;32:*.ppt=00;32:*.pptx=00;32:*.potx=00;32:*.pot=00;32:*.odt=00;32:*.ods=00;32:*.odp=00;32:*.cvx=00;32:*README=00;33:*README.txt=00;33:*readme=00;33:*readme.txt=00;33:*TODO=00;33:*TODO.txt=00;33:*MEMO=00;33:*MEMO.txt=00;33:*memo=00;33:*memo.txt=00;33:"
export ZLS_COLORS="${LS_COLORS}"
export CLICOLOR="true"
export GREP_COLOR='1;37;41'

#alias
alias c="clear"
alias cdd="cd ../"
alias cddd="cd ../../"
alias cdddd="cd ../../../"
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -hl'
alias la='ls -a'
alias lla='ls -la'
alias mv="mv -i"
alias rm='rm -i'
alias grep='grep -E --color=auto'
alias od='od -txlz -Ax -v'
alias src="source ~/.zshrc"

#prompt
# 色付きにする。
autoload -Uz colors
colors
# 上から順に、ユーザ名、ホスト名、カレントディレクトリ、グループ名、プロンプト
# プロンプトは、スーパーユーザ時に #
# スーパーユーザ以外かつ直前のコマンドの終了コードが 0 であるなら !, 0 でないなら $
#p_usr="%{${fg[green]}%}%n%{${reset_color}%}"
#p_hst="%{${fg[magenta]}%}@%m%{${reset_color}%}"
#p_dir="%{${fg[cyan]}%}:%/%{${reset_color}%}"
#p_grp="[${GROUP}]"
#p_prt="%(?!%(!.#.$) !? )"
#PROMPT="${p_usr}${p_hst}${p_dir}"$'\n'"${p_grp}${p_prt}"
## if ... fi とか "..." など、複数行にわたる場合
#PROMPT2="%{${fg[yellow]}%}%_> %{${reset_color}%}"
## コマンド訂正時
#SPROMPT="%{${fg[yellow]}%}correct%{${reset_color}%}: %{${fg[red]}%}%R%{${reset_color}%} => %{${fg[cyan]}%}%r%{${reset_color}%} (y|n|a|e)? "
PROMPT="[%~]"$'\n'" %#  "
# 右に出るプロンプト。日時を表示する。
RPROMPT="[%D{%m/%d %H:%M}]"

# ヒストリ探索
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
# 補完候補の色付け、メッセージの設定
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 補完で大文字小文字を区別しない。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補をカーソルで選ぶ。
zstyle ':completion:*:default' menu select=1

#use macvim for vim&vi----
#if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ];then
#    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#fi
#export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export EDITOR=vim
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

# tmux 自動起動
# 初期に用意されているセッション
# "prefix -> (" or "prefix -> )" でセッション切り替え
TMUX_INITIAL_SESSIONS=(
"config"
"works"
"personal"
)
# 初期セッションが存在していなかったらバックグラウンドで作る
for tmux_session in ${TMUX_INITIAL_SESSIONS[@]}
do
  if ! $(tmux has-session -t ${tmux_session} 2> /dev/null)
  then
    tmux new-session -d -s ${tmux_session}
  fi
done
# tmux が起動中でなければ attach する
if [ -z "$TMUX" ]
then
  tmux attach-session -t "${TMUX_INITIAL_SESSIONS[0]}"
else
fi

#pager
export PAGER="less"

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
export PATH="${PYENV_ROOT}/shims:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-vertualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi;

#gettext
export PATH="/usr/local/opt/gettext/bin:$PATH"

# cuda
export PATH="/usr/local/cuda-8.0/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH"

# CUDA Toolkit
export CUDA_ROOT=/usr/local/cuda
export PATH=/usr/local/cuda/bin:${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export CPATH=/usr/local/cuda/include:$CPATH

# cuDNN
export LIBRARY_PATH=/usr/local/cuda/lib64:$LIBRARY_PATH

# ros
alias .ros='source /opt/ros/kinetic/setup.zsh'
#補完を無効にする
compdef -d roscd
compdef -d rospd
compdef -d rosd
compdef -d rosls
compdef -d rosed
compdef -d roscp
compdef -d rosrun
