SUDO=$(which sudo 2>/dev/null)

BASE_PATH=$(pwd)

mkdir -p work
cd work

curl -l -o JetBrainsMono.zip https://download-cdn.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip -o JetBrainsMono.zip
cd fonts/ttf
$SUDO mkdir -p /usr/local/share/fonts/j
$SUDO mv * /usr/local/share/fonts/j
cd $BASE_PATH
rm -rf work
fc-cache -f -v

