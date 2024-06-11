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

curl -L -o FiraMono.zip https://objects.githubusercontent.com/github-production-release-asset-2e65be/27574418/fcdf33da-a171-4fe3-a748-b0e02dcaaea4?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20240611%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240611T150703Z&X-Amz-Expires=300&X-Amz-Signature=0a5b1d19ce8012b1db4ed52287182dff2505a670067e17ef688fc028f6431735&X-Amz-SignedHeaders=host&actor_id=95411487&key_id=0&repo_id=27574418&response-content-disposition=attachment%3B%20filename%3DFiraMono.zip&response-content-type=application%2Foctet-stream
unzip FiraMono.zip

$SUDO cp FiraMono /usr/share/fonts/opentype
$SUDO fc-cache -fv


cd $BASE_PATH
rm -rf work
fc-cache -f -v

