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
    mkdir -p $HOME/.cargo && touch $HOME/.cargo/env
    which starship &> /dev/null && return
    which curl &> /dev/null || (echo curl not found! && exit 1)
    curl https://starship.rs/install.sh -o starship-install.sh
    # chmod +x starship-install.sh
    # echo yes | ./starship-install.sh 
    sh starship-install.sh -y
    rm starship-install.sh
}

function install_zsh_scripts(){
    which git &> /dev/null || (echo git not found! && exit 1)
    # zsh-autosuggestions
    # zsh-history-substring-search

    if [ ! -d "$HOME/.oh-my-zsh" ]; then 
        CHSH=no RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    
    zsh -c "source $HOME/.zshrc"
}

read -p "Install Starship ? [Y/n] " yn
case $yn in
    [Yy] )  install_staship;;
    [Nn] ) ;;
    * )  install_staship;;
esac

read -p "Install zsh extensions ? [Y/n] " yn
case $yn in
    [Yy] ) install_zsh_scripts;;
    [Nn] )  ;;
    * ) install_zsh_scripts;;
esac


RED='\033[0;31m'
NC='\033[0m' # No Color
echo "for ${RED} autojump ${NC} refer to: https://github.com/wting/autojump"
