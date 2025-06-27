#!/bin/bash
SCRIPT_LOCATION="/mnt/development/bash/Install-Scripts/"
opt=$(kdialog --combobox "Select an Install:" "Steam" "Signal" "Docker" "Libvirt" "FirewallD" "Joplin" "Libreoffice" "quit")

case $opt in
    Steam)
        bash $SCRIPT_LOCATION/Install-Steam.sh
        ;;
    Signal)
        bash $SCRIPT_LOCATION/Install-Signal.sh
        ;;
    Docker)
         bash $SCRIPT_LOCATION/
        ;;
    Libvirt)
         bash $SCRIPT_LOCATION/
        ;;
    FirewallD)
        bash $SCRIPT_LOCATION/
        ;;
    Joplin)
        bash $SCRIPT_LOCATION/
        ;;
    Docker)
         bash $SCRIPT_LOCATION/
        ;;
    Libvirt)
         bash $SCRIPT_LOCATION/
        ;;
    quit)
        break
        ;;
    *)
        echo "Invalid option $REPLY"
        ;;
esac


