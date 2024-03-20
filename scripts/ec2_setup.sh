#!bin/bash

sudo apt update 

sudo apt-get update 

sudo apt upgrade -y

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo usermod -aG docker $USER

newgrp docker

sudo apt install awscli -y



## AWS configuration

aws configure


## Now setup elastic IP on AWS


## Now setup git secrets
#  under your github repository setting go to secrets and variables --> Actions --> click on New Repository Secret and add all below one by one
#          url: ${{ secrets.URL }} - Name: URL, value: <jenkins server url>
#          user: ${{ secrets.USER }} - Name: USER, value: <your jenkins user name>
#          token: ${{ secrets.TOKEN }} - Name: TOKEN, 
#                                       value: <got to Jenkin server - click on your name (profile) --> Configure --> Add new Token 
#                                       Generate and copy - paste it>
#          job: ${{ secrets.JOBS }} - Name: JOBS, value: <copy paste your jenkins pipeline job name

# after that commit final changes from you local to github