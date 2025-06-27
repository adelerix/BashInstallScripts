#!/bin/bash


press_enter() {
  # echo ""
  # echo -n "	Press Enter to continue "
  # read
  clear
}

function deb_kdecleanup() {
   sudo apt remove kontrast kmail korganizer kaddressbook konqueror kmag kmousetool kmouth juk akregator firefox-esr -y && sudo apt install -y libdbus-glib-1-2 && sudo apt autoremove -y
}

function install_flatpak() {
sudo apt install flatpak -y
#sudo apt install plasma-discover-backend-flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}


function install_pipewire(){
sudo apt install -y pipewire pipewire-alsa and pipewire-jack wireplumber pipewire-pulse libspa-0.2-bluetooth
}

function reboot(){
sudo reboot
}


incorrect_selection() {
  echo "Incorrect selection! Try again."
}

until [ "$selection" = "0" ]; do
  clear
  echo ""
  echo " *NOTE* Flatpak and Pipewire are already enabled from Debian 13+"
  echo ""
  echo "    	1  -  Debian KDE Cleanup"
  echo "    	2  -  Install Flatpak"
  echo "    	3  -  Install Pipewire"
  echo "    	0  -  Exit"
  echo ""
  echo -n "  Enter selection: "
  read selection
  echo ""
  case $selection in
    1 ) clear ; deb_kdecleanup ; press_enter ;;
    2 ) clear ; install_flatpak ; press_enter ;;
    3 ) clear ; install_pipewire ; press_enter ;;
    0 ) clear ; exit ;;
    * ) clear ; incorrect_selection ; press_enter ;;
  esac
done
