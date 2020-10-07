#!/bin/bash
# You will need to edit to fit your enviroment ###
##########McAfee Virus Scan to XML################
cp avvclean.dat /usr/local/uvscan/
cp avvnames.dat /usr/local/uvscan/
cp avvscan.dat /usr/local/uvscan/
cp avvscan.dat /usr/local/uvscan/

####################################################
HOSTNAME=$(cat /etc/hostname | awk '{print $NF}')
var2=$(date '+%Y-%m-%d')
cd /usr/local/uvscan
./uvscan -r --secure --summary --VERBOSE --XMLPATH=report.xml --RPTALL /home
mv report.xml uvscan-$HOSTNAME-$var2.xml
mv uvscan-$HOSTNAME-$var2.xml /EXTERNAL DEVICE OR LOCATION(CHANGE ME)/scan_results
clear
echo "Scan Complete on $HOSTNAME's /home "
