#!/bin/bash

firstString=`grep -E "^(ID)=" /etc/os-release`
DISTRO=$( echo $firstString| tr [:upper:] [:lower:] | grep -Poi '(debian|ubuntu|red hat|centos|fedora|arch)' | uniq)
if [ -z $DISTRO ]; then
    DISTRO='unknown'
fi
if [[ $DISTRO == 'arch' ]]; then
    echo "Arch Ollama Install"
    curl -fsSL https://ollama.com/install.sh | sh
elif [[ $DISTRO == 'debian' ]]; then
    echo "Debian Ollama Install"
    curl -fsSL https://ollama.com/install.sh | sh

elif [[ $DISTRO == 'fedora' ]]; then
    echo "Fedora Ollama Install"
    curl -fsSL https://ollama.com/install.sh | sh
else
    echo "Unknown Distro"
fi


