#!/bin/bash

echo 'NoDisplay=true' | sudo tee -a /usr/share/applications/display-im6.q16.desktop # Remove ImageMagick Shourtcut
sudo sed -i 's/Education\;Science\;Math//g' /usr/share/applications/libreoffice25.2-math.desktop # Remove Libreoffice Math Shourtcut from Education
