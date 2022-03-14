#!/bin/bash
RED='\033[1;31m'
NC='\033[0m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
echo 
echo -e "${RED}Kernal Release:${NC} $(uname -r)"
echo -e "${GREEN}Bash Version:${NC} $BASH_VERSION"
echo 
echo "Disk Free:" 
echo 
echo "$(df -h)"
echo 
echo "Free Memory:"
echo "$(free)"
echo 
echo -e "${GREEN}Total files in $(pwd):${NC} $(ls | wc -l)"
echo
echo -e "${GREEN}IP Address:${NC} $(hostname -I)"
echo
echo -e "${YELLOW}Active Interfaces:${NC}"
echo
ip link show
echo
