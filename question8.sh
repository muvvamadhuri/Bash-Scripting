#!/bin/bash
echo
echo "Instance ID and Type: "
aws ec2 describe-instances --query "Reservations[*].Instances[*].{Name:Tags[?Key=='Name']|[0].Value,Status:State.Name, Instance:InstanceId, InstanceType:InstanceType}" --output table
echo
read -p "Enter the Instance ID: " instanceid
echo -e "\nStopping Instance $instaceid..."
aws ec2 stop-instances --instance-ids $instanceid --output table
echo -e "\nChange to which tier?\n\nType a tier:\nt1.micro\nt2.nano\nt2.micro\nt2.small\nt2.medium"
read -p "Enter the tier you want to change it to: " instancetype
aws ec2 modify-instance-attribute --instance-id $instanceid --instance-type "{\"Value\": \"$instancetype\"}"
echo
echo "Changing tier..."
aws ec2 describe-instances --query "Reservations[*].Instances[*].{Name:Tags[?Key=='Name']|[0].Value,Status:State.Name, Instance:InstanceId, InstanceType:InstanceType}" --output table
echo
echo "Tier of $instanceid changed to $instancetype :)"
echo
echo "Now starting the instance....."
echo
aws ec2 start-instances --instance-ids $instanceid --output table
echo
echo "Instance up and running waiting for Status Check..."