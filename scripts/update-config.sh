#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

# ACTION="cp -f"
proj_root=$(pwd)
unalias -a
declare -A installed

# Read user input
read -p "COPY or SYMLINK ? [C/s/q] " cs
# Perform action based on choice
echo read $cs
case $cs in
    [cC]) ACTION="cp -af" ;;
    [sS]) ACTION="ln -sf" ;;
    [qQ])  echo "quitting..." ; exit ;;
    *) ACTION="cp -af" ;;
esac

source=dotfiles
dest=$HOME

echo DOTFILES

current_date=$(date)

function action(){
    # echo action for file "$dest/$file"
    # echo "$dest/$file"
    if [ -f "$dest/$file" ]; then
        #it's a file
        # echo action for file $file
        mkdir -p "$proj_root/$BAK/$source" 
        cp $dest/$file "../$BAK/$source/$file"  1>/dev/null 2>&1
        # cp "$dest/$file" "$proj_root/$BAK/$source/$file" 
    fi
    # echo updating $dest/$file
    rm $dest/$file 1>/dev/null 2>&1
    $ACTION $(pwd)/$file $dest/$file
}

function update(){
    # Check if the folder exists
    if [ ! -d "$source" ]; then
        echo "source folder $source not found!"
        exit 1
    fi
    if [ ! -d "$dest" ]; then 
        mkdir -p "$dest"
    fi

    #setup backups
    BAK=bak/$current_date
    echo "backup is in: $(pwd)/$BAK"
    mkdir -p "$BAK"

    cd $source

    # Iterate over files in the folder
    shopt -s dotglob
    for file in *; do
        if [ -f "$file" ]; then
            #it's a file
            # echo file: $file
            # cp $file "../$BAK/$source/$file"

            read -p "Update $file ? [Y/n] " yn
            case $yn in
                [Nn]) continue ;;
            esac
            action

        fi
    done

    cd ..
}

update

source=.config
dest=$HOME/.config

echo "------------------------"
echo .CONFIG FILES

update