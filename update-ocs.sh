#!/bin/bash

clear
echo "clear" >> .bashrc
echo 'echo -e "      # ###       ###                  /"' >> .bashrc
echo 'echo -e "    /  /###  /     ###               #/"' >> .bashrc
echo 'echo -e "   /  /  ###/       ##               ##"' >> .bashrc
echo 'echo -e "  /  ##   ##        ##               ##"' >> .bashrc
echo 'echo -e " /  ###             ##               ##"' >> .bashrc
echo 'echo -e "##   ##             ##  ###  /###    ##  /##   ######"' >> .bashrc
echo 'echo -e "##   ##             ##   ###/ #### / ## / ### /#######"' >> .bashrc
echo 'echo -e "##   ##             ##    ##   ###/  ##/   / /      ##"' >> .bashrc
echo 'echo -e "##   ##             ##    ##         ##   /         /"' >> .bashrc
echo 'echo -e "##   ##             ##    ##         ##  /         /"' >> .bashrc
echo 'echo -e " ##  ##             ##    ##         ## ##        ###"' >> .bashrc
echo 'echo -e "  ## #      /       ##    ##         ######        ###"' >> .bashrc
echo 'echo -e "   ###     /        ##    ##         ##  ###        ###"' >> .bashrc
echo 'echo -e "    ######/         ### / ###        ##   ### /      ##"' >> .bashrc
echo 'echo -e "      ###            ##/   ###        ##   ##/       ##"' >> .bashrc
echo 'echo -e "                                                     /"' >> .bashrc
echo 'echo -e "                                                    /"' >> .bashrc
echo 'echo -e "                                                   /"' >> .bashrc
echo 'echo -e "                                                  /"' >> .bashrc
echo 'echo -e "welcome to the server $HOSTNAME" | lolcat' >> .bashrc
echo 'echo -e "Script mod by Clrkz"' >> .bashrc
echo 'echo -e "Type menu to display a list of commands"' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo " "
echo " Latest Version: 2.0"
echo " Changelogs:"
echo " Kill Multilogin"
echo " Delete All Expired User"
echo " Ban and Unban User"
echo " View Usage Data"
echo " Menu Update"
echo " Added Update Support"
echo " "
 read -r -p "Are you sure? [Y/n]" response
 response=${response,,} # tolower
 if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
sudo apt-get install nload
cd /usr/bin
wget -O menu "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-menu.sh"
wget -O limitdb "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-userlimitdropbear.sh"
wget -O limitssh "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-userlimitssh.sh"
wget -O delexp "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-delexp.sh"
wget -O usage "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-usage.sh"
wget -O update "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-ocs.sh"
wget -O ban "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-ban.sh"
wget -O unban "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-unban.sh"
chmod +x menu
chmod +x limitdb && sed -i -e 's/\r$//' limitdb
chmod +x limitssh && sed -i -e 's/\r$//' limitssh
chmod +x delexp && sed -i -e 's/\r$//' delexp
chmod +x usage && sed -i -e 's/\r$//' usage
chmod +x update && sed -i -e 's/\r$//' update
chmod +x ban && sed -i -e 's/\r$//' ban
chmod +x unban && sed -i -e 's/\r$//' unban
cd
clear
echo " "
echo "DONE! OCS Autoscript Update By Clrkz" 
menu
 fi
