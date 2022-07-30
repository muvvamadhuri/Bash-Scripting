import paramiko
import boto3
ec2 = boto3.resource('ec2')
client = boto3.client('ec2')
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
file = '/home/linux/test.pem'
running_instances = []
ec2client = boto3.client('ec2',region_name='us-west-1')
response = ec2client.describe_instances()
for reservation in response["Reservations"]:
    for instance in reservation["Instances"]:
        if instance['State']['Name'] == 'running':
            x = (instance["InstanceId"])
            print(instance)
            y = (instance["PublicDnsName"])
            print(y)
            running_instances.append(y)
#print('Number of running instances', len(running_instances))
            ssh.connect(y, username='ec2-user', key_filename=file)
#stdin, stdout, stderr = ssh.exec_command("uptime;ls -l;touch mickymouse;ls -l;uptime")
            stdin, stdout, stderr = ssh.exec_command("sudo yum update -y; sudo yum install git -y; git version; git init; git remote add origin https://github.com/Akarsha1994/IADT_Assignment7.git; git fetch; cd /var/www/html; git checkout origin/main index.html")
            stdin.flush()
            data = stdout.read().splitlines()
            for line in data:
                print(line)
ssh.close()


