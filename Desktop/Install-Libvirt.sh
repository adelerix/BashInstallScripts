#!/bin/bash

firstString=`grep -E "^(ID)=" /etc/os-release`
DISTRO=$( echo $firstString| tr [:upper:] [:lower:] | grep -Poi '(debian|ubuntu|red hat|centos|fedora|arch)' | uniq)
if [ -z $DISTRO ]; then
    DISTRO='unknown'
fi
if [[ $DISTRO == 'arch' ]]; then
    echo "Arch Install"

elif [[ $DISTRO == 'debian' ]]; then
    echo "Debian LibVirt Install"
    sudo apt install --no-install-recommends qemu-system libvirt-clients libvirt-daemon-system virtinst virt-manager ovmf gir1.2-spiceclientgtk-3.0 qemu-utils -y
    sudo adduser ${USER} libvirt
    sudo systemctl enable libvirtd --now

elif [[ $DISTRO == 'fedora' ]]; then
    echo "Fedora Install"

else
    echo "Unknown Distro"
fi






