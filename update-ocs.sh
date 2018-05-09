#!/bin/bash
#Update

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
