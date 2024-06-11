SUDO=$(which sudo 2>/dev/null)

curl -l -o JetBrainsMono.zip https://download-cdn.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip JetBrainsMono.zip
cd ttf
$SUDO cp * /usr/lcoal/share/fonts
