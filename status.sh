#!/bin/bash
HOSTNAME=$(cat /etc/hostname | awk '{print $NF}')
IPADDRESS=$(hostname -I | awk '{print $1}')
NETWORKINTERFACE=$(nmcli device show | grep -i general.device | awk '{print $NF}' | grep -i ^e | awk '{print $NF}')
ADMINS=$(cat /etc/group | grep -i wheel | sed 's/^...........//g' | awk '{print $NF}')
LUKS=$(lsblk | grep -i luks | sed 's/^.........//g' | awk '{print $1}')
LUKSDRIVE=$(lsblk | grep -B 1 -i luks | awk 'NR==1{print $1}' | sed 's/^..//' | awk '{print $NF}')
MAC=$(ifconfig | grep -i ether | awk 'NR==1{print $2}')
OS=$(eval $(grep PRETTY_NAME /etc/os-release) ; echo ${PRETTY_NAME})
KERNEL=$(uname -r | awk '{print}')
USERS=$(awk -F'[/:]' '{if ($3 >= 1000 && $3 != 65534) print $1}' /etc/passwd | paste -d, -s | awk '{print}')
ADMINS=$(grep -i wheel /etc/group | sed 's/^...........//g' | awk '{print}')
YUM=$(tail -1 /var/log/yum.log | awk '{print $1,$2,$3}')
FILESTRUCTURE=$(df -h | grep -v tmpfs | grep -v run | grep -v data | awk '{print}')
CPU=$(cat /proc/cpuinfo | grep -i model\ name | awk 'NR==1{print $4,$5,$6,$7,$8,$9,$10,$11,$12,$13}')
MAKE=$(/usr/sbin/dmidecode | grep -i "product name" | awk 'NR==1{print}' | sed 's/^...............//g' | awk '{print}')
SERIAL=$(/usr/sbin/dmidecode | grep -i "serial number" | awk 'NR==1{print}' | sed 's/^................//g' | awk '{print}')
RAM=$(/usr/sbin/dmidecode | grep -i "range size" | awk 'NR==1{print}' | sed 's/^.............//g' | awk '{print}')
VGA=$(/usr/sbin/lspci | grep -i vga | awk '{print $5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17}')
PACKAGES=$(yum list installed | cat -n | awk '{print $1}'|tail -1 | awk '{print}')


{
mkdir -p /home/local_admin/Laptop_Logs/$HOSTNAME
} &> /dev/null 2>&1
cd /home/local_admin/Laptop_Logs/$HOSTNAME
touch status-report-$HOSTNAME.txt
{
echo "OS= $OS"
echo "Current Kernel= $KERNEL"
echo "Last Yum Update= $YUM"
} | boxes -d stone > status-report-$HOSTNAME.txt
{
echo "Hostname= $HOSTNAME"
echo "IP Address= $IPADDRESS"
echo "Network Interface= $NETWORKINTERFACE"
echo "MAC= $MAC"
} | boxes -d stone >> status-report-$HOSTNAME.txt
{
echo "Users= $USERS"
echo "Admins= $ADMINS"
} | boxes -d stone >> status-report-$HOSTNAME.txt
{
echo "Luks Drive= $LUKSDRIVE"
echo "Luks= $LUKS"
} | boxes -d stone >> status-report-$HOSTNAME.txt
{
echo "Make and Model= $MAKE"
echo "Serial Number= $SERIAL"
echo "CPU= $CPU"
echo "Memory= $RAM"
echo "Graphics= $VGA"
} | boxes -d stone >> status-report-$HOSTNAME.txt
{
echo "$FILESTRUCTURE"
} | boxes -d stone >> status-report-$HOSTNAME.txt
{
echo -ne "Total packages installed on machine= "
echo -e $PACKAGES
} | boxes -d stone >> status-report-$HOSTNAME.txt

{
echo "SOFTWARE"
echo -ne "SoftwareNameHere Installed?"
{
find /path/of/installed/software
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "...................YES"
else
    echo -e "...................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /path/of/installed/software
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "......................YES"
else
    echo -e "......................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /usr/pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".....................YES"
else
    echo -e ".....................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /usr/pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "......YES"
else
    echo -e "......NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /usr/pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "..........................YES"
else
    echo -e "..........................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /usr//pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".....................YES"
else
    echo -e ".....................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /usr//pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "...................YES"
else
    echo -e "...................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /usr//pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".....................YES"
else
    echo -e ".....................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /usr//pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".......................YES"
else
    echo -e ".......................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /usr//pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "......................YES"
else
    echo -e "......................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /etc//pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".......................YES"
else
    echo -e ".......................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find //pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".....................YES"
else
    echo -e ".....................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find //pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "........................YES"
else
    echo -e "........................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /usr//pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".........................YES"
else
    echo -e ".........................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /opt//pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".....................YES"
else
    echo -e ".....................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /opt//pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".....................YES"
else
    echo -e ".....................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /opt//pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".....................YES"
else
    echo -e ".....................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /opt/pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".............YES"
else
    echo -e ".............NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
yum list installed | grep -i software
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".................YES"
else
    echo -e ".................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find //pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "........................YES"
else
    echo -e "........................NO"
fi

echo -ne "SoftwareNameHere Installed?"
{
find /usr//pathtoinstallation
} &> /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e ".....................YES"
else
    echo -e ".....................NO"
fi
} | boxes -d stone >> status-report-$HOSTNAME.txt
