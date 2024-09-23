#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
WHITE='\033[0;1;37m'
NC='\033[0m'

echo -e "${ORANGE}-${NC} Executing ${WHITE}/usr/bin/nmap -iL $1amass_ipaddr_list.txt -T3 -oN $2nmap_amass_output.txt${NC}..."
/usr/bin/nmap -iL $1amass_ipaddr_list.txt -T3 -oN $2nmap_amass_output.txt
echo -e "${ORANGE}-${NC} Executing ${WHITE}/usr/bin/nmap -iL $1assetfinder_ipaddr_list.txt -T3 -oN $2nmap_assetfinder_output.txt${NC}..."
/usr/bin/nmap -iL $1assetfinder_ipaddr_list.txt -T3 -oN $2nmap_assetfinder_output.txt
echo -e "${ORANGE}-${NC} Executing ${WHITE}/usr/bin/nmap -iL $1nikto_ipaddr_list.txt -T3 -oN $2nmap_nikto_output.txt${NC}..."
/usr/bin/nmap -iL $1nikto_ipaddr_list.txt -T3 -oN $2nmap_nikto_output.txt
echo -e "${GREEN}+${NC} Done..."
fi
