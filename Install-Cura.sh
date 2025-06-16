#!/bin/bash

echo -e "\e[1;33mInstalling Cura\e[0m"
echo ""

DISTRO=$( cat /etc/*-release | tr [:upper:] [:lower:] | grep -Poi '(debian|ubuntu|red hat|centos|fedora)' | uniq )
if [ -z $DISTRO ]; then
    DISTRO='unknown'
fi
if [ $DISTRO = "fedora" ]; then
    sudo dnf install -y curl jq wget
elif [ $DISTRO = "debian" ]; then
    sudo apt install -y curl jq wget
fi

LATESTVERS=`curl -sL https://api.github.com/repos/Ultimaker/Cura/releases/latest | jq -r ".tag_name"`
sudo mkdir /opt/cura/
sudo wget https://github.com/Ultimaker/Cura/releases/download/${LATESTVERS}/UltiMaker-Cura-${LATESTVERS}-linux-X64.AppImage -O /opt/cura/UltiMaker-Cura.AppImage
sudo chmod +x /opt/cura/UltiMaker-Cura.AppImage
mkdir -p ~/.local/share/applications/
cat >> ~/.local/share/applications/cura.desktop <<-EOF
[Desktop Entry]
Encoding=UTF-8
Name=Cura
Comment=3D Printing Slicer
Exec=/opt/cura/UltiMaker-Cura.AppImage
Icon=cura
StartupWMClass=Cura
Type=Application
Categories=Graphics;
EOF
