#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
WHITE='\033[0;1;37m'
NC='\033[0m'

if [ "$1" == "" ];then
	echo "${RED}-${NC} You did not provide a domain."
	echo "${RED}-${NC} Syntax:  /usr/share/scripts/amass_script.sh <domain> <output_path>"
	echo "${RED}-${NC} Example: /usr/share/scripts/amass_script.sh google.com /usr/outputs/"
elif [ "$2" == "" ];then
	echo "${RED}-${NC} You did not provide an output path."
	echo "${RED}-${NC} Syntax:  /usr/share/scripts/amass_script.sh <domain> <output_path>"
	echo "${RED}-${NC} Example: /usr/share/scripts/amass_script.sh google.com /usr/outputs/"
else
	echo -e "${ORANGE}-${NC} Executing ${WHITE}/usr/bin/amass enum -d $1 >> $2amass_output.txt${NC}..."
	/usr/bin/amass enum -d $1 >> $2amass_output.txt
	echo -e "${ORANGE}-${NC} Executing ${WHITE}grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' $2amass_output.txt >> $2amass_ipaddr_list.txt${NC}..."
	grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" $2amass_output.txt >> $2amass_ipaddr_list.txt
	echo -e "${GREEN}+${NC} Done..."
fi
