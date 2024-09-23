#!/bin/bash
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
WHITE='\033[0;1;37m'
NC='\033[0m'
echo -e "${ORANGE}-${NC} Executing ${WHITE}/usr/bin/assetfinder $1 >> $2assetfinder_output.txt${NC}..."
/usr/bin/assetfinder $1 >> $2assetfinder_output.txt
echo -e "${GREEN}+${NC} Done..."
