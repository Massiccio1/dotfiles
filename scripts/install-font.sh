read -p "Install Nerd Font ? [Y/n] " yn

case $yn in
    [Yy] )  ;;
    [Nn] ) exit 0;;
    * )  ;;
esac


SUDO=$(which sudo 2>/dev/null)

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

