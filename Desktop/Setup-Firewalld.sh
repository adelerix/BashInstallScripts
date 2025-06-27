#!/bin/bash

firstString=`grep -E "^(ID)=" /etc/os-release`
DISTRO=$( echo $firstString| tr [:upper:] [:lower:] | grep -Poi '(debian|ubuntu|red hat|centos|fedora|arch)' | uniq)
if [ -z $DISTRO ]; then
    DISTRO='unknown'
fi
if [[ $DISTRO == 'arch' ]]; then
    echo "Arch Install"

elif [[ $DISTRO == 'debian' ]]; then
    echo "Debian Firewalld Install"
    sudo apt install -y firewalld
    sudo systemctl enable --now firewalld
    sudo firewall-cmd --add-service=kdeconnect --permanent
    sudo firewall-cmd --add-service=syncthing --permanent
    sudo firewall-cmd --add-service=mdns --permanent
    sudo firewall-cmd --add-service=samba-client --permanent
    sudo firewall-cmd --add-port=5355/udp --permanent
    sudo firewall-cmd --add-port=8612/udp --permanent
    sudo firewall-cmd --reload
elif [[ $DISTRO == 'fedora' ]]; then
    echo "Fedora Install"

else
    echo "Unknown Distro"
fi




