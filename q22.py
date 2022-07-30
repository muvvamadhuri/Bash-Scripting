
import boto3

client = boto3.client('autoscaling')

response = client.create_launch_configuration(
    LaunchConfigurationName='assignment',
    ImageId= 'ami-052efd3df9dad4825',
#    InstanceId= 'i-057a7fb38ca2f61b4',
    KeyName= 'question2',
    InstanceType= 't2.micro',
    SecurityGroups=[
        'sg-0ac2d1d15d949c1f4',
    ],
    UserData= '#!/bin/bash \
sudo yum update -y \
sudo yum install -y httpd \
sudo systemctl start httpd \
sudo systemctl enable httpd' 
)

print(response)

response = client.create_auto_scaling_group(
    AutoScalingGroupName='autoscaling',
    LaunchConfigurationName= 'assignment',
    MaxInstanceLifetime=2592000,
    MaxSize=3,
    MinSize=2,
    VPCZoneIdentifier='subnet-03c2166c641acee79'
)

print(response)
