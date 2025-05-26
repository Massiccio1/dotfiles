#!/bin/bash

# declare -A osInfo;
# osInfo[/etc/redhat-release]=yum
# osInfo[/etc/arch-release]=pacman
# osInfo[/etc/gentoo-release]=emerge
# osInfo[/etc/SuSE-release]=zypp
# osInfo[/etc/debian_version]=apt-get
# osInfo[/etc/alpine-release]=apk

# for f in ${!osInfo[@]}
# do
#     if [[ -f $f ]];then
#         echo Package manager: ${osInfo[$f]}
#     fi
# done

function install_staship(){
    which starship &> /dev/null && return

    mkdir -p $HOME/.cargo && touch $HOME/.cargo/env
    which curl &> /dev/null || (echo curl not found! && exit 1)
    curl https://starship.rs/install.sh -o starship-install.sh
    # chmod +x starship-install.sh
    # echo yes | ./starship-install.sh 

    unset SUDO
    if [ "$(whoami)" != "root" ]; then 
        SUDO=sudo
    fi
    echo "installing starship"

    $SUDO sh starship-install.sh --yes
    echo "starship ok"
    rm starship-install.sh
}

function install_zsh_scripts(){
    which git &> /dev/null || (echo git not found! && exit 1)
    # zsh-autosuggestions
    # zsh-history-substring-search
    echo "installing zsh tools"

    if [ ! -d "$HOME/.oh-my-zsh" ]; then 
        CHSH=yes RUNZSH=yes KEEP_ZSHRC=yes sh -c yes | "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
    ZSH_CUSTOM=~/.oh-my-zsh/custom/plugins/
    if [ -d "$ZSH_CUSTOM" ]; then 
        echo $ZSH_CUSTOM
        cd "$ZSH_CUSTOM"
        echo $(pwd)

        if cd "zsh-history-substring-search"; then git pull; else git clone https://github.com/zsh-users/zsh-history-substring-search; fi;
        cd "$ZSH_CUSTOM"
        if cd "zsh-autosuggestions"; then git pull; else git clone  https://github.com/zsh-users/zsh-autosuggestions; fi
        cd "$ZSH_CUSTOM"
        if cd "zsh-syntax-highlighting"; then git pull; else git clone https://github.com/zsh-users/zsh-syntax-highlighting.git; fi
    fi 
    zsh -c "source $HOME/.zshrc"
}


function install_fastfetch(){
    which fastfetch 1>/dev/null 2>/dev/null && return
    unset SUDO
    if [ "$(whoami)" != "root" ]; then 
        SUDO=sudo
    fi

    curl -OL https://github.com/fastfetch-cli/fastfetch/releases/download/2.15.0/fastfetch-linux-amd64.deb
    # $SUDO chown _apt fastfetch-linux-amd64.deb 
    $SUDO apt install -y ./fastfetch-linux-amd64.deb
    rm -f ./fastfetch-linux-amd64.deb
}
# install

function install_font(){

    $SUDO apt install -y unzip fontconfig
    BASE_PATH=$(pwd)
    mkdir -p work
    cd work

    # curl -L -o JetBrainsMono.zip https://download-cdn.jetbrains.com/fonts/JetBrainsMono-2.304.zip
    # unzip -o JetBrainsMono.zip
    # cd fonts/ttf
    # $SUDO mkdir -p /usr/local/share/fonts/j
    # $SUDO mv * /usr/local/share/fonts/j



    #now firamono

    curl -L -o FiraMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraMono.zip"
    unzip FiraMono.zip

    $SUDO mkdir -p /usr/share/fonts/opentype
    $SUDO cp *.otf /usr/share/fonts/opentype
    $SUDO fc-cache -fv


    cd $BASE_PATH
    rm -rf work
    fc-cache -f -v


}



startpwd=$(pwd)


install_staship

install_zsh_scripts

install_fastfetch

install_font


RED='\033[0;31m'
NC='\033[0m' # No Color
echo "for  autojump refer to: https://github.com/wting/autojump"

cd "$startpwd"


