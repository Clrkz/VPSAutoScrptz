#!/bin/bash
cd /usr/bin
wget -O updates "https://github.com/Clrkz/VPSAutoScrptz/raw/master/update-ocs.sh" 
chmod +x updates
sed -i -e 's/\r$//' updates
./updates
