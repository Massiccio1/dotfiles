#######################################################
# prompt
#######################################################


export PS1="\[\e[36m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\] \[\e[32m\]\w\[\e[m\] \e[35m\]$\[\e[m\] "

export GREP_COLOR='1;31'

bind 'set completion-ignore-case on'

#if [ -t 0 ]; then
#  stty -ixon -ixoff
#fi

#######################################################
# aliases
#######################################################

alias ls='ls --color=auto'
alias ll='ls -lah'
alias l='ll'
alias grep='grep --color=auto -i'
alias gl='git log --graph --all'
alias rm='rm -vR'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

#######################################################
# source .bash_profile.local
#######################################################

if [ -f "$HOME/.bash_profile.local" ]; then source "$HOME/.bash_profile.local"; fi
