#!/bin/bash

firstString=`grep -E "^(ID)=" /etc/os-release`
DISTRO=$( echo $firstString| tr [:upper:] [:lower:] | grep -Poi '(debian|ubuntu|red hat|centos|fedora|arch)' | uniq)
if [ -z $DISTRO ]; then
    DISTRO='unknown'
fi
if [[ $DISTRO == 'arch' ]]; then
    echo "Arch Install"

elif [[ $DISTRO == 'debian' ]]; then
    echo "Debian AMDGPU Install"
    wget https://repo.radeon.com/amdgpu-install/6.4.1/ubuntu/noble/amdgpu-install_6.4.60401-1_all.deb
    sudo apt install ./amdgpu-install_6.4.60401-1_all.deb
    sudo apt update
    sudo apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"
    sudo apt install amdgpu-dkms

elif [[ $DISTRO == 'fedora' ]]; then
    echo "Fedora Install"

else
    echo "Unknown Distro"
fi


