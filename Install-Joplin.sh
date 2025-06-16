#!/bin/bash
firstString=`grep -E "^(ID)=" /etc/os-release`
DISTRO=$( echo $firstString| tr [:upper:] [:lower:] | grep -Poi '(debian|ubuntu|red hat|centos|fedora|arch)' | uniq)
if [ -z $DISTRO ]; then
    DISTRO='unknown'
fi
if [[ $DISTRO == 'arch' ]]; then
    echo "Arch Install"

elif [[ $DISTRO == 'debian' ]]; then
    echo "Debian Joplin Install"
    echo -e "\e[1;33mInstalling Joplin\e[0m"
    echo ""
    DOWNLOAD_TYPE="New"
    RELEASE_VERSION=$(wget -qO - "https://api.github.com/repos/laurent22/joplin/releases/latest" | grep -Po '"tag_name": ?"v\K.*?(?=")')
    SANDBOXPARAM="--no-sandbox"
    TEMP_DIR=$(mktemp -d)
    wget -O "${TEMP_DIR}/Joplin.AppImage" "https://objects.joplinusercontent.com/v${RELEASE_VERSION}/Joplin-${RELEASE_VERSION}.AppImage?source=LinuxInstallScript&type=$DOWNLOAD_TYPE"
    wget -O "${TEMP_DIR}/joplin.png" https://joplinapp.org/images/Icon512.png
    sudo mkdir -p /opt/joplin/
    sudo mv "${TEMP_DIR}/Joplin.AppImage" /opt/joplin/Joplin.AppImage
    sudo mv "${TEMP_DIR}/joplin.png" /opt/joplin/joplin.png

    # Gives execution privileges
    sudo chmod +x /opt/joplin/Joplin.AppImage

    mkdir ~/.local/share/applications/ >> /dev/null
    cat >> ~/.local/share/applications/appimagekit-joplin.desktop <<-EOF
    [Desktop Entry]
    Encoding=UTF-8
    Name=Joplin
    Comment=Joplin for Desktop
    Exec=/opt/joplin/Joplin.AppImage ${SANDBOXPARAM} %u
    Icon=joplin
    StartupWMClass=Joplin
    Type=Application
    Categories=Office;
    MimeType=x-scheme-handler/joplin;
    X-GNOME-SingleWindow=true // should be removed eventually as it was upstream to be an XDG specification
    SingleMainWindow=true
    EOF

elif [[ $DISTRO == 'fedora' ]]; then
    echo "Fedora Install"

else
    echo "Unknown Distro"
fi


