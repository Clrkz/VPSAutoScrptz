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
echo " This script will set up a password protected, elite"
echo "             proxy on your target server"
echo "                      By Clrkz                  "
echo "*****************************************************"
echo " "
echo " "
echo "Please enter a user name for Squid:"
read u
echo " "
echo "Please enter a password (will be shown in plain text while typing):"
read p
echo " "

clear

htpasswd -b -c /etc/squid3/squid_passwd $u $p

#Delete squid
#htpasswd -D /etc/squid3/squid_passwd $u

service squid3 restart

clear

echo " "
echo "***************************************************"
echo "   Squid proxy server set up has been completed."
echo " "
echo "You can access your proxy server at $ip"
echo "on port 8000,8080 with user name $u"
echo " "
echo "***************************************************"
echo " "
echo " "