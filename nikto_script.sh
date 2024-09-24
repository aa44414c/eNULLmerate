#!/bin/bash
# Bash script to run specific commands in Nikto
# for enumeration based on input from main.py of
# eNULLmerate.

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
WHITE='\033[0;1;37m'
NC='\033[0m'

# Use Httprobe output as input for Nikto
echo -e "${ORANGE}-${NC} Executing ${WHITE}/usr/bin/nikto -h $1httprobe_output.txt -maxtime 5 >> $2nikto_httprobe_output.txt${NC}..."
/usr/bin/nikto -h $1httprobe_output.txt -maxtime 5 >> $2nikto_httprobe_output.txt
echo -e "${ORANGE}-${NC} Executing ${WHITE}grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' $1nikto_httprobe_output.txt >> $2nikto_ipaddr_list.txt${NC}..."
grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" $1nikto_httprobe_output.txt >> $2nikto_httprobe_ipaddr_list.txt

# Use Amass output as input for Nikto
echo -e "${ORANGE}-${NC} Executing ${WHITE}/usr/bin/nikto -h $1amass_output.txt -maxtime 5 >> $2nikto_amass_output.txt${NC}..."
/usr/bin/nikto -h $1amass_output.txt -maxtime 5 >> $2nikto_amass_output.txt
echo -e "${ORANGE}-${NC} Executing ${WHITE}grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' ${NC}..."
grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" $1nikto_amass_output.txt >> $2nikto_amass_ipaddr_list.txt

# Use Assetfinder output as input for Nikto
echo -e "${ORANGE}-${NC} Executing ${WHITE}/usr/bin/nikto -h $1assetfinder_output.txt -maxtime 5 >> $1nikto_assetfinder_output.txt${NC}..."
/usr/bin/nikto -h $1assetfinder_output.txt -maxtime 5 >> $1nikto_assetfinder_output.txt
echo -e "${ORANGE}-${NC} Executing ${WHITE}grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' ${NC}..."
grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" $1nikto_assetfinder_output.txt >> $2nikto_assetfinder_ipaddr_list.txt

# Indicate when complete
echo -e "${GREEN}+${NC} Done..."