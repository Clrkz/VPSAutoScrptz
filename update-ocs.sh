#!/bin/bash

clear
cd /usr/bin
wget -O menu "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-menu.sh"
wget -O limitdb "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-userlimitdropbear.sh"
wget -O limitssh "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-userlimitssh.sh"
wget -O delexp "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-delexp.sh"
chmod +x menu
chmod +x limitdb
chmod +x limitssh
chmod +x delexp
clear
echo " "
echo "DONE! OCS Autoscript Update By Clrkz" 
menu
