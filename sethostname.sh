#!/bin/bash
##Can be combined with others scripts for a laptop setup script
########################################### Echo Coloring ##############################################
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
BCyan='\033[4;36m'
Blue='\033[0;34m'
###################################################################################################
echo -e ${Blue}Please type in the machines Hostname${NC}
read var2
echo -ne ${RED}Setting Hostname${NC}
echo $var2 > /etc/hostname && echo -e "${GREEN}..........Hostname Set!${NC}"
done
