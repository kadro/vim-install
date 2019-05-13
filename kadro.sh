alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias gs="git status"
alias gc="git checkout $1"
alias gp="git pull"

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

GIT_PS1_SHOWDIRTYSTATE="."
GIT_PS1_SHOWUNTRACKEDFILES="."
GIT_PS1_SHOWSTASHSTATE="."
GIT_PS1_SHOWUPSTREAM="auto"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\e[1;31m\]\$(parse_git_branch) \[\033[0m\]\\$ "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

