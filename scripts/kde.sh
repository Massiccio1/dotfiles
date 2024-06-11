
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



if [ -f "$HOME/scripts/deltmp.sh" ]; then
    $SUDO ln /etc/rc6.d/k99deltmp $HOME/scripts/deltmp.sh
fi

$SUDO ln -s $HOME/scripts/deltmp.sh /etc/rc6.d/k99deltmp 

cd ../..