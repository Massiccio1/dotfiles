alias alais="alias"
alias bahs="bash "

alias grep="grep --color=always -i"
alias grep2="grep -b5 -a5 --color=always -i"

alias gbrc='$EDITOR ~/.bashrc 2>/dev/null 1>/dev/null &'
alias gba='$EDITOR ~/.bash_aliases   2>/dev/null 1>/dev/null &'
alias gzrc='$EDITOR ~/.zshrc  2>/dev/null 1>/dev/null &'

#alias k="$EDITOR & 2>/dev/null 1>/dev/null"
alias ag="alias | grep"
alias eg="env | grep"
alias aliaspull='OLD=$(pwd) && builtin cd $HOME/git/dotfiles && git pull && builtin cd $OLD'


alias sudokate='SUDO_EDITOR=kate sudoedit'

alias ll='lsd -alFh'
alias lll='cl && lsd -alFh'
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
alias du="du -ad 1 -h | sort -h"
alias du2="/usr/bin/du"

alias mkdir='mkdir -p'
alias mk="mkdir"
alias mkdor="mkdir"


alias testa="echo test alias"
alias neofetch="fastfetch"
alias neofetch2="/usr/bin/neofetch"
alias ff="fastfetch"

alias root="sudo su -m"

alias cls="clear"
alias cl="clear"
alias s="source ~/.bashrc"
alias zs="source ~/.zshrc"
alias cat="batcat -f --paging never "
alias cat2="/usr/bin/cat"
alias cat3="cl && cat"


alias less="less -FX"

alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll="git log --graph --decorate --color --all"
alias gs="git status"


alias snu="sudo nala update"
alias sni="sudo nala install -y"
alias sns="sudo nala search "
alias snr="sudo nala remove "

alias p3="python3"

alias mntu="sudo mount /dev/nvme0n1p4 /mnt/u20"
alias mntw="sudo mount /dev/nvme0n1p3 /mnt/windows"
alias mntd="sudo mount /dev/nvme0n1p8 /mnt/deb"

alias dol="dolphin .  2>/dev/null 1>/dev/null &"
alias f2="ll | grep2 "

alias dockerstart="sudo systemctl start docker.socket && sudo systemctl start docker.service"
alias dockerstop="sudo systemctl stop docker.socket && sudo systemctl stop docker.service"
alias dockerdisable="sudo systemctl disable docker.socket && sudo systemctl start docker.service"
alias dockerenable="sudo systemctl enable docker.socket && sudo systemctl stop docker.service"

alias debian="docker run -d -p 6901:6901 -p 5901:5901 -v $PWD:/shared:ro piopirahl/docker-desktop:1.0.2 && echo http://localhost:6901/"
alias alpine="docker run -d  -e GROUP_ID=1000 -e USER_ID=1000 -e TZ=Europe/Rome --cap-add SYS_ADMIN --shm-size 2g -p 5801:5800 shokinn/docker-alpine-desktop:latest && echo http://localhost:5800"
alias d="docker"
alias dub="docker run -it -v .:/test ubuntu:24.10 bash"

alias ca="conda activate"
alias condad="conda deactivate"

alias dcu="docker compose up -d --remove-orphans"
alias dcd="docker compose down"
alias dcr="docker compose restart"


alias drrmi="docker run --rm -it "
alias drrm="docker run --rm"
alias dex2="docker exec -it"
alias ports='netstat -tulanp'

alias pserver="python3 -m http.server"

alias jobs="jobs -lp"

alias db="dbeaver 1>/dev/null 2>&1 &"


alias xampp="sudo /opt/lampp/lampp "
alias xampp2="sudo /opt/lampp/manager-linux-x64.run"

alias xfreerdp="wlfreerdp /dynamic-resolution "

alias t="task"
alias tl="task all"


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
    $EDITOR $1 2>/dev/null 1>/dev/null & 
}

cd (){
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}

# IP address lookup
function myip()
{
	# Internal IP Lookup.
	INT_IP=$(hostname -I | awk '{print $1}')
	# INT_IP=$(hostname -I) | awk -F '{print $1}'
    echo "Internal IP: $INT_IP"
	# External IP Lookup
    echo -n "External IP: "
	EXT_IP=$(curl -s ifconfig.me)
	echo $EXT_IP
}


function mk2(){
    if [ -z "$1" ];then
        pass the name of the directory as argument
        return 0
    fi
    mkdir -p $1 && cd $1
}

function fdroppy(){
    which droppy &> /dev/null || (echo "install droppy with npm install -g droppy" && return 0)
    echo to change to public droppy run droppy-public
    droppy start -f .
}

function droppy-public(){
    sed -i 's/"public": false,/"public": true,/' $HOME/.droppy/config/config.json
}


function du3(){
    sudo du -h -d 1 |
    awk '{printf "%s %08.2f\t%s\n",
        index("KMG", substr($1, length($1))),
        substr($1, 0, length($1)-1), $0}' |
    sort -r | cut -f2,3
}
function f(){
    find_string=$1
    find_string+="*"
    find . -name "$find_string"
}

function dex(){
    container_id=$1
    docker exec -it $container_id bash
}

ta(){
    task add $@
    task list
}

td(){
    task $1 done
    task list
}

#------------------------------------------

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi




