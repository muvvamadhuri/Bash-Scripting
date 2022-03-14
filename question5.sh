!/bin/bash
clear
echo
BLUE='\033[1;36m'
RED='\033[0;31m'
GREEN='\033[1;32m'
NC='\033[0m'
read -p "Enter Pincode:" PIN
pinlen=${#PIN}

if [[ ("$pinlen" -eq 6 ) && ( $PIN =~ ^[0-9]+$ ) ]]
then
        echo -e  "\n${RED}Invalid Input (US pin contains 5 digits)${NC}"

elif [[ ( "$pinlen" -eq 5 ) && ( $PIN =~ ^[0-9]+$ ) ]]
then
        echo -e "\n$PIN--->${BLUE}US Pin${NC}"

elif [[ ( "$pinlen" -eq 6 ) && ( $PIN =~ ^[a-zA-Z0-9]+$ ) ]]
then
        echo -e "\n$PIN--->${GREEN}Canadian Pin${NC}"

else
        echo -e "\n${RED}Invalid Input!!!${NC}"
fi
