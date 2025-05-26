
unset SUDO
if [ "$(whoami)" != "root" ]; then 
    export SUDO=sudo
fi

function install_staship(){
    
    $SUDO apt install starship -y
}

function install_zsh_scripts(){
    which git &> /dev/null || (echo git not found! && exit 1)
    # zsh-autosuggestions
    # zsh-history-substring-search
    echo "installing zsh tools"

    CHSH=yes RUNZSH=yes KEEP_ZSHRC=yes     sh  ./installers/omz.sh

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

function install_font(){

    $SUDO apt install -y unzip fontconfig
    BASE_PATH=$(pwd)
    mkdir -p work
    cd work

    curl -L -o FiraMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraMono.zip"
    unzip FiraMono.zip

    $SUDO mkdir -p /usr/share/fonts/opentype
    $SUDO cp *.otf /usr/share/fonts/opentype
    $SUDO fc-cache -fv


    cd $BASE_PATH
    rm -rf work
    fc-cache -f -v

}

function install_sudoers(){

    $SUDO  sh -c 'echo $SUDO_USER ALL=\(ALL:ALL\) NOPASSWD:ALL >> /etc/sudoers' || echo "no sudo command, you are probably root, no need to set sudoers"
}


startpwd=$(pwd)


install_staship

install_zsh_scripts

# install_font

RED='\033[0;31m'
NC='\033[0m' # No Color
# echo "for  autojump refer to: https://github.com/wting/autojump"

cd "$startpwd"


