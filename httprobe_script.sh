#!/bin/bash
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
WHITE='\033[0;1;37m'
NC='\033[0m'
echo -e "${ORANGE}-${NC} Executing ${WHITE}cat $1assetfinder_output.txt | /usr/bin/httprobe >> $2httprobe_output.txt${NC}..."
cat $1assetfinder_output.txt | /usr/bin/httprobe >> $2httprobe_output.txt
echo -e "${GREEN}+${NC} Done..."
fi
