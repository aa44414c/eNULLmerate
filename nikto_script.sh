#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
WHITE='\033[0;1;37m'
NC='\033[0m'

echo -e "${ORANGE}-${NC} Executing ${WHITE}/usr/bin/nikto -h $1httprobe_output.txt -maxtime 5 >> $2nikto_output.txt${NC}..."
/usr/bin/nikto -h $1httprobe_output.txt -maxtime 5 >> $2nikto_output.txt
echo -e "${ORANGE}-${NC} Executing ${WHITE}grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' $1nikto_output.txt >> $2nikto_ipaddr_list.txt${NC}..."
grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" $1nikto_output.txt >> $2nikto_ipaddr_list.txt
echo -e "${GREEN}+${NC} Done..."
fi
