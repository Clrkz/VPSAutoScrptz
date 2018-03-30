#!/bin/bash
#Script auto create user SSH

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (day): " Activetime

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$Activetime days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "====SSH Account Information====" | lolcat
echo -e "Host: $IP"
echo -e "Username: $Login "
echo -e "Password: $Pass" 
echo -e "Port OpenSSH: 22,444"
echo -e "Port Dropbear: 143,3128"
echo -e "Port SSL: 443"
echo -e "Port Squid: 8000,8080"
echo -e "Config OpenVPN (TCP 1194): http://$IP:81/client.ovpn"
echo -e "-----------------------------" | lolcat
echo -e "Expiration: $exp"
echo -e "=============================" | lolcat
echo -e "Mod by Clrkz"
echo -e ""