#!/bin/bash

######################################################################
##
##   Docker Installation Script
##   Written By: Ankit Ojha
##   URL: 
##   Update on: May 25, 2022
##
######################################################################

install_ubuntu() {
    ## Remove any pre installed docker packages:
    which docker
    if [ $? -eq 0 ];then
       sudo service docker stop
       sudo apt-get remove -y docker-ce docker-engine docker.io containerd runc
       sudo apt-get purge -y docker-ce docker-ce-cli containerd.io
       sudo apt -y autoremove
       cd /var/lib
       rm -rf docker
    else
       echo "docker is not installed.. continue to install"
    fi


 ## Install using the repository:
    sudo apt-get update -y
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

## Add Dockers official GPG key & stable repo
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

 ## Install Docker latest
    sudo apt-get update -y ; clear
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    sudo systemctl enable docker
    sudo service docker restart
    exit 0
}

install_centos() {

    which docker
    if [ $? -eq 0 ];then
       sudo yum remove docker-client-latest docker-latest docker-latest-logrotate docker-logrotate docker-engine
       cd /var/lib
       rm -rf docker
       yum clean
    else
       echo "docker is not installed... continue to install"
    fi

    sudo yum install -y yum-utils   ## device-mapper-persistent-data lvm2
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum install -y docker-ce docker-ce-cli containerd.io
    sudo systemctl enable docker
    sudo systemctl start docker

}
################ MAIN ###################

if [ -f /etc/os-release ];then
   osname=`grep ID /etc/os-release | egrep -v 'VERSION|LIKE|VARIANT' | cut -d'=' -f2 | sed -e 's/"//' -e 's/"//'`
   echo $osname
   if [ $osname == "ubuntu" ];then
       install_ubuntu
   elif [ $osname == "amzn" ];then
       install_centos
   elif [ $osname == "centos" ];then
       install_centos
  fi
else
   echo "can not locate /etc/os-release - unable find the osname"
   exit 8
fi
exit 0

