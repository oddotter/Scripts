#!/bin/bash
## Can be used with other scripts to create laptop setup script
########################################### Echo Coloring ##############################################
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
BCyan='\033[4;36m'
Blue='\033[0;34m'
#######################################################################3
echo -e "${Blue}Please type in the Date (yyyymmdd)${NC}"
read var5
echo -e "${Blue}Please type in the Time (hh:mm:ss)(24hr format)${NC}"
read var6
echo -ne "${RED}Setting Date & Time${NC}"
{
date +%Y%m%d -s "$var5"
date +%T -s "$var6"
hwclock -w
} &>> /home/local_admin/Desktop/Dev-laptop-log.txt && echo -e "${GREEN}..........Date & Time set!${NC}"
done
