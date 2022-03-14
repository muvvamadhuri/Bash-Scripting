#!/bin/bash
read -p "Enter the username to create IAM user: " IAMUSER
echo "Creating user $IAMUSER....."
echo -e "\e[1;31m Save the Access Key and Private Key!!! \e[0m"
exec aws iam create-user --user-name $IAMUSER
 
