#!/bin/bash

firstString=`grep -E "^(ID)=" /etc/os-release`
DISTRO=$( echo $firstString| tr [:upper:] [:lower:] | grep -Poi '(debian|ubuntu|red hat|centos|fedora|arch)' | uniq)
if [ -z $DISTRO ]; then
    DISTRO='unknown'
fi
if [[ $DISTRO == 'arch' ]]; then
    echo "Arch Install"

elif [[ $DISTRO == 'debian' ]]; then
    echo -e "\e[1;32mDebian Install\e[0m"
    echo -e "\e[1;33mInstalling Latest LibreWolf\e[0m"
    echo ""
    sudo apt update && sudo apt install extrepo -y
    sudo extrepo enable librewolf
    sudo apt update && sudo apt install librewolf -y
elif [[ $DISTRO == 'fedora' ]]; then
    echo "Fedora Install"

else
    echo "Unknown Distro"
fi






