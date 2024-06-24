
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

echo "#\!/bin/bash" > $HOME/scripts/deltmp.sh
echo "/usr/bin/rm -rf $HOME/Downloads/delete/*" >> $HOME/scripts/deltmp.sh

chmod +x  $HOME/scripts/deltmp.sh


$SUDO ln -s $HOME/scripts/deltmp.sh /etc/rc6.d/K99deltmp

cd ../..