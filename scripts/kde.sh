cd kde

read -p "Override all configs, shortcuts and scripts with no backup? [Y/n] " yn

case $yn in
    [Yy] )  ;;
    [Nn] ) exit 0;;
    * )  ;;
esac

mkdir -p ~/scripts
mkdir -p ~/.config

cd .config

cp -rf * ~/.config
cd ..
cd scripts
cp -rf * ~/scripts
cd ../..