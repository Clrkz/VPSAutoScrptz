#!/bin/bash
#Menu

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

echo -e "* menu      : Displays a list of available commands"
echo -e "* usernew   : Creating an SSH Account"
echo -e "* trial     : Create a Trial Account"
echo -e "* delete    : Clearing SSH and OpenVPN Account"
echo -e "* check     : Check User Login"
echo -e "* member    : Check Member SSH and OpenVPN"
echo -e "* limitdb   : Kill Multilogin Dropbear"
echo -e "* limitssh  : Kill Multilogin SSHD"
echo -e "* delexp    : Delete Expired User"
echo -e "* restart   : Restart Service dropbear, webmin"
echo -e "              squid3, OpenVPN and SSH"
echo -e "* reboot    : reboot VPS"
echo -e "* speedtest : speedtest VPS"
echo -e "* info      : System Information"
echo -e "* about     : Information about auto install script"
echo -e "* exit      : exit Putty/Connecbot/"
echo -e "              JuiceSSH"
echo -e ""