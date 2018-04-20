#!/bin/bash
#
# Original script by fornesia, rzengineer and fawzya 
# Mod by Clrkz for Adding OCS Panel
# 
# ==================================================

MYIP=$(wget -qO- ipv4.icanhazip.com);
: '
# check registered ip
wget -q -O daftarip http://188.166.215.119:85/ocs/ip.txt
if ! grep -w -q $MYIP daftarip; then
	echo "Sorry, only registered IPs can use this script!"
	if [[ $vps = "vps" ]]; then
		echo "Powered by Clrkz"
	else
		echo "Powered by Clrkz"
	fi
	rm -f /root/daftarip
	exit
fi
'
# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";

#detail nama perusahaan
country=ID
state=Manila
locality=Manila
organization=ByteHAX
organizationalunit=IT
commonname=bytehax.blogspot.com
email=143Clarkz@gmail.com

# go to root
cd

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# install wget and curl
apt-get update;apt-get -y install wget curl;

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Manila /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart

# set repo
wget -O /etc/apt/sources.list "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/sources.list.debian7"
wget "http://www.dotdeb.org/dotdeb.gpg"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
wget -qO - http://www.webmin.com/jcameron-key.asc | apt-key add -

# update
apt-get update

# install webserver
apt-get -y install nginx

# install essential package
apt-get -y install nano iptables dnsutils openvpn screen whois ngrep unzip unrar

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

# install webserver
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/nginx.conf"
mkdir -p /home/vps/public_html
echo "<pre>Setup by Clrkz</pre>" > /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/vps.conf"
service nginx restart

# install openvpn
wget -O /etc/openvpn/openvpn.tar "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/openvpn-debian.tar"
cd /etc/openvpn/
tar xf openvpn.tar
wget -O /etc/openvpn/1194.conf "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/1194.conf"
service openvpn restart
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
iptables -t nat -I POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE
iptables-save > /etc/iptables_yg_baru_dibikin.conf
wget -O /etc/network/if-up.d/iptables "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/iptables"
chmod +x /etc/network/if-up.d/iptables
service openvpn restart

# konfigurasi openvpn
cd /etc/openvpn/
wget -O /etc/openvpn/client.ovpn "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/client-1194.conf"
sed -i $MYIP2 /etc/openvpn/client.ovpn;
cp client.ovpn /home/vps/public_html/

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/badvpn-udpgw64"
fi
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300

# setting port ssh
cd
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 444' /etc/ssh/sshd_config
service ssh restart

# install dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=3128/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 143"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
service ssh restart
service dropbear restart

# install squid3
cd
apt-get -y install squid3
wget -O /etc/squid3/squid.conf "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/squid3.conf"
sed -i $MYIP2 /etc/squid3/squid.conf;
service squid3 restart

# install webmin
cd
apt-get -y install webmin
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
service webmin restart

# install stunnel
apt-get install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1


[dropbear]
accept = 443
connect = 127.0.0.1:3128

END

#membuat sertifikat
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

#konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

# teks berwarna
apt-get -y install ruby
gem install lolcat

# install fail2banapt-get -y install fail2ban;
service fail2ban restart 

# install ddos deflate
cd
apt-get -y install dnsutils dsniff
wget https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/ddos-deflate-master.zip 
unzip ddos-deflate-master.zip
cd ddos-deflate-master
./install.sh
rm -rf /root/ddos-deflate-master.zip 

# bannerrm /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/issue.net"
sed -i 's@#Banner@Banner@g' /etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear
service ssh restart
service dropbear restart

#xml parser
cd
apt-get -y --force-yes -f install libxml-parser-perl

# download script
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/trial.sh"
wget -O delete "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/hapus.sh"
wget -O check "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/user-login.sh"
wget -O member "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/user-list.sh"
wget -O restart "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/resvis.sh"
wget -O speedtest "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/info.sh"
wget -O about "https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/about.sh"

echo "0 0 * * * root /sbin/reboot" > /etc/cron.d/reboot

chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x delete
chmod +x check
chmod +x member
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about

# finishing
cd
chown -R www-data:www-data /home/vps/public_html
service nginx start
service openvpn restart
service cron restart
service ssh restart
service dropbear restart
service squid3 restart
service webmin restart
rm -rf ~/.bash_history && history -c
echo "unset HISTFILE" >> /etc/profile

# install neofetch
echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | tee -a /etc/apt/sources.list
curl "https://bintray.com/user/downloadSubjectPublicKey?username=bintray"| apt-key add -
apt-get update
apt-get install neofetch

echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | tee -a /etc/apt/sources.list
curl "https://bintray.com/user/downloadSubjectPublicKey?username=bintray"| apt-key add -
apt-get update
apt-get install neofetch

# info
clear
echo "Autoscript Include:" | tee log-install.txt
echo "===========================================" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Service"  | tee -a log-install.txt
echo "-------"  | tee -a log-install.txt
echo "OpenSSH  : 22, 444"  | tee -a log-install.txt
echo "Dropbear : 143, 3128"  | tee -a log-install.txt
echo "SSL      : 443"  | tee -a log-install.txt
echo "Squid3   : 8000, 8080 (limit to IP SSH)"  | tee -a log-install.txt
echo "OpenVPN  : TCP 1194 (client config : http://$MYIP:81/client.ovpn)"  | tee -a log-install.txt
echo "badvpn   : badvpn-udpgw port 7300"  | tee -a log-install.txt
echo "nginx    : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Script"  | tee -a log-install.txt
echo "------"  | tee -a log-install.txt
echo "menu (Displays a list of available commands)"  | tee -a log-install.txt
echo "usernew (Creating an SSH Account)"  | tee -a log-install.txt
echo "trial (Create a Trial Account)"  | tee -a log-install.txt
echo "delete (Clearing SSH Account)"  | tee -a log-install.txt
echo "check (Check User Login)"  | tee -a log-install.txt
echo "member (Check Member SSH)"  | tee -a log-install.txt
echo "restart (Restart Service dropbear, webmin, squid3, openvpn and ssh)"  | tee -a log-install.txt
echo "reboot (Reboot VPS)"  | tee -a log-install.txt
echo "speedtest (Speedtest VPS)"  | tee -a log-install.txt
echo "info (System Information)"  | tee -a log-install.txt
echo "about (Information about auto install script)"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Other features"  | tee -a log-install.txt
echo "----------"  | tee -a log-install.txt
echo "Webmin   : http://$MYIP:10000/"  | tee -a log-install.txt
echo "Timezone : Asia/Manila (GMT +7)"  | tee -a log-install.txt
echo "IPv6     : [off]"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Original Script by Fornesia, Rzengineer & Fawzya"  | tee -a log-install.txt
echo "Modified by Clrkz"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "VPS AUTO REBOOT TIME HOURS 12 NIGHT"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "==========================================="  | tee -a log-install.txt
cd
rm -f /root/debian7.sh
