#!/bin/bash

firstString=`grep -E "^(ID)=" /etc/os-release`
DISTRO=$( echo $firstString| tr [:upper:] [:lower:] | grep -Poi '(debian|ubuntu|red hat|centos|fedora|arch)' | uniq)
if [ -z $DISTRO ]; then
    DISTRO='unknown'
fi
if [[ $DISTRO == 'arch' ]]; then
    echo "Arch Install not available"

elif [[ $DISTRO == 'debian' ]]; then
    echo "Debian Steam Install"
    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt install steam-installer
    sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386

elif [[ $DISTRO == 'fedora' ]]; then
    echo "Fedora Install not available"

else
    echo "Unknown Distro"
fi






