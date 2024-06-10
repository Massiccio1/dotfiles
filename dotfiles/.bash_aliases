alias alais="alias"

alias gbrc="kate ~/.bashrc 2>/dev/null 1>/dev/null &"
alias gba="kate ~/.bash_aliases   2>/dev/null 1>/dev/null &"
alias gzrc="kate ~/.zshrc  2>/dev/null 1>/dev/null &"
#alias k="kate & 2>/dev/nulìl 1>/dev/null"
alias ag="alias | grep"
alias aliaspull="cd $HOME/git/dotfiles && git pull"


alias sudokate='SUDO_EDITOR=kate sudoedit'

alias ll='lsd -alFh'
alias la='lsd -A'
alias l='lsd -F'
alias lsr="lsd -R"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ......="cd ../../../../.."
alias -- -="cd -"

alias rm="trash-put -r"
alias rm2="/usr/bin/rm"

alias cp="cp -r"
alias cp2="/usr/bin/cp"

alias df="df -h"
alias du="du -d 1 -h"
alias mkdir='mkdir -p'
alias mk="mkdir -p"

alias testa="echo test alias"
alias neofetch="fastfetch"
alias ff="fastfetch"

alias root="sudo su -m"

alias cls="clear"
alias cl="clear"
alias s="source ~/.bashrc"
alias zs="source ~/.zshrc"
alias cat2="/usr/bin/cat"
alias cat="batcat -f --paging never "

alias grep="grep --color=always -i"
alias grep2="grep -b5 -a5 --color=always -i"

alias less="less -FX"


alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll="git log --graph --decorate --color --all"
alias gs="git status"


alias snu="sudo nala update"
alias sni="sudo nala install -y"
alias sns="sudo nala search "

alias mntu="sudo mount /dev/nvme0n1p4 /mnt/u20"
alias mntw="sudo mount /dev/nvme0n1p3 /mnt/windows"
alias mntd="sudo mount /dev/nvme0n1p8 /mnt/deb"

alias dol="dolphin .  2>/dev/null 1>/dev/null &"
alias f="ll | grep "
alias f2="ll | grep2 "

alias dockerstart="sudo systemctl start docker.socket && sudo systemctl start docker.service"
alias dockerstop="sudo systemctl stop docker.socket && sudo systemctl stop docker.service"
alias debian="docker run -d -p 6901:6901 -p 5901:5901 -v $PWD:/shared:ro piopirahl/docker-desktop:1.0.2 && echo http://localhost:6901/"
alias alpine="docker run -d  -e GROUP_ID=1000 -e USER_ID=1000 -e TZ=Europe/Rome --cap-add SYS_ADMIN --shm-size 2g -p 5801:5800 shokinn/docker-alpine-desktop:latest && echo http://localhost:5800"
alias d="docker"

alias ca="conda activate"
alias condad="conda deactivate"

alias dcu="docker compose up -d --remove-orphans"
alias drrmi="docker run --rm -it "
alias drrm="docker run --rm"
alias dex="docker exec -it"
#------------------------------------


alias h="history"
alias hg="history | grep2"
# alias path="echo -e ${PATH//:/\\n}"

path(){
    echo -e ${PATH//:/\\n}
}



gitall(){
    GIT_COMMIT_MESSAGE="default autocommit"
    if [ ! -z "$1" ];then
       GIT_COMMIT_MESSAGE=$(printf '%s ' "$@")
    fi
    git add .
    git commit -m "$GIT_COMMIT_MESSAGE"
    git push
    git status
    # echo variable set $GIT_COMMIT_MESSAGE
    unset GIT_COMMIT_MESSAGE
}

k(){
    kate $1 2>/dev/null 1>/dev/null & 
}

cd (){
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}


#------------------------------------------

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi



