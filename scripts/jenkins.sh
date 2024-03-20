#!bin/bash

sudo apt update 

sudo apt install openjdk-8-jdk -y

https://pkg.jenkins.io/
https://pkg.jenkins.io/debian-stable/

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt-get install fontconfig openjdk-17-jre
sudo apt-get install jenkins
  
java --version

sudo systemctl start jenkins

sudo systemctl enable jenkins

sudo systemctl status jenkins



## Installing Docker

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo usermod -aG docker $USER

sudo usermod -aG docker jenkins


newgrp docker

sudo apt install awscli -y

sudo usermod -a -G docker jenkins


## AWS configuration 

aws configure


## Reboot EC2 and check jenkins status - it should be restarted

sudo systemctl status jenkins

## Now setup elastic IP on AWS & associate it with jenkins-machine

## open browser and paste public ip of EC2 with port 8080 (you may need to add this port 8080 in security group)

## For getting the admin password for jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

## setup suggested plugins and create username and passwords

## go to manage jenkins to add following: 
# Dashboard --> Manage Jenkins --> Credentials  --> System  --> Global credentials (unrestricted)
#   kind as Secret Text --> credentials('ECR_REPOSITORY') - add as secret id
#       - select create ECR repository as chest copy URI in secret text 
#   kind as Secret Text --> credentials('AWS_ACCOUNT_ID') - add as secret id
#       - copy - paste your AWS account id in secret text 
#   kind as Secret Text --> credentials('AWS_ACCESS_KEY_ID') - add as secret id
#       - copy - paste your AWS access key id in secret text
#   kind as Secret Text --> credentials('AWS_SECRET_ACCESS_KEY') - add as secret id
#        - copy - paste your AWS secret access key in secret text
#   kind as SSH Username with private key --> credentials('ssh_key') - add as secret id
#       -  select Enter directly (radio button) 
#       -  open your pem file in text editor and copy - paste text as-is

# again go to manage jenkins to add following: 
# Dashboard --> Manage Jenkins --> Plugins --> Available Plugins --> Search for SSH
#   install SSH agent from list and then restart Jenkins

# after restart Jenkins - setup pipeline
# Dashboard --> + New Item --> Enter pipline name as 'chest-pipeline' --> select PIPELINE
# go down in the page and select "Pipeline script from SCM" under Pipeline --> Defination section
#   Select Git from SCM and provide your git hub reposiroty and select/type branch as "main" 
#   update your Jenkins file path correctly - this should match with your code
# save it     

################################################################
# Now to setup another ec2 instance and configure as per ec2_setup.sh files steps