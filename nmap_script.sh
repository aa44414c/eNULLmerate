#!/bin/bash
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
WHITE='\033[0;1;37m'
NC='\033[0m'
echo -e "${ORANGE}-${NC} Executing ${WHITE}/usr/bin/nmap -iL $1assetfinder_output.txt -T3 -oN $2nmap_output.txt${NC}..."
/usr/bin/nmap -iL $1assetfinder_output.txt -T3 -oN $2nmap_output.txt
echo -e "${GREEN}+${NC} Done..."
