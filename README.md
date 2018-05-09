# VPSAutoScrptz
Service:
OpenSSH: 22,444  
Dropbear: 143,3128  
SSL: 443  
Squid: 8000,8080

OpenVPNOpenVPN(TCP): 1194

# Installation
OCS Panel Only: wget https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/OCSAutoScrptz.sh && chmod +x OCSAutoScrptz.sh && ./OCSAutoScrptz.sh

OCS & VPS: wget https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/VPSnOCScrptZ.sh && chmod +x VPSnOCScrptZ.sh && ./VPSnOCScrptZ.sh

VPS Only (For Servers) : wget https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/VPScrptZ.sh && chmod +x VPScrptZ.sh && ./VPScrptZ.sh

Disable Change Password in Panel: wget https://raw.githubusercontent.com/Clrkz/VPSAutoScrptz/master/DsblChngPW.sh && chmod +x DsblChngPW.sh && ./DsblChngPW.sh

Updates:
Kill Multilogin, Delete All Expired Users
cd && wget -O ClrkzOCSUpdate "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-ocs.sh" && chmod +x ClrkzOCSUpdate && sed -i -e 's/\r$//' ClrkzOCSUpdate && ./ClrkzOCSUpdate && rm ClrkzOCSUpdate

# Credits
Modder: Clrkz https://fb.com/143Clarkz

Original script by :
* Fornesia
* Rzengineer
* Fawzya
