#!/bin/bash
# Bash script to run specific commands in Httprobe
# for enumeration based on input from main.py of
# eNULLmerate.

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
WHITE='\033[0;1;37m'
NC='\033[0m'

echo -e "${ORANGE}-${NC} Executing ${WHITE}cat $1assetfinder_output.txt | httprobe >> $2httprobe_output.txt${NC}..."
cat $1assetfinder_output.txt | httprobe >> $2httprobe_output.txt
echo -e "${GREEN}+${NC} Done..."