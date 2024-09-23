#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
WHITE='\033[0;1;37m'
NC='\033[0m'
echo -e "${ORANGE}-${NC} Executing ${WHITE}/usr/bin/nikto -h $1httprobe_output.txt -maxtime 15 >> $2nikto_output.txt${NC}..."
if /usr/bin/nikto -h $1httprobe_output.txt -maxtime 5 >> $2nikto_output.txt | grep -q '+ ERROR: Host maximum execution time of 5 seconds reached'; then
	echo -e "${RED}+${NC} ERROR: Host maximum execution time of 5 seconds reached..."
echo -e "${GREEN}+${NC} Done..."
fi
