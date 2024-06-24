
read -p "Override all configs, shortcuts and scripts with no backup? [Y/n] " yn

case $yn in
    [Yy] )  ;;
    [Nn] ) exit 0;;
    * )  ;;
esac
SUDO=$(which sudo 2>/dev/null)
cd kde

mkdir -p ~/scripts
mkdir -p ~/.config

cd .config

cp -rf * ~/.config
cd ..
cd scripts
cp -rf * ~/scripts


# if [ -f "$HOME/scripts/deltmp.sh" ]; then
#     $SUDO ln -s $HOME/scripts/deltmp.sh /etc/rc6.d/k99deltmp
# fi



# Replace line in delete service
SEARCH_PATTERN="massimo"
REPLACEMENT=$(whoami)
sed -i "s/$SEARCH_PATTERN/$REPLACEMENT/" $HOME/scripts/deltmp.sh
sed -i "s/$SEARCH_PATTERN/$REPLACEMENT/" $HOME/scripts/deltmp2.sh

chmod +x  $HOME/scripts/deltmp.sh
chmod +x  $HOME/scripts/deltmp2.sh

$SUDO rm -rf /etc/systemd/system/deltmp2.service
$SUDO ln -s $HOME/scripts/deltmp2.sh /etc/systemd/system/deltmp2.service
$SUDO systemctl daemon-reload
$SUDO systemctl enable deltmp2.service



cd ../..