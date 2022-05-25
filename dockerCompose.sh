######################################################################
##
##   Docker Compose Installation Script
##   Written By: Ankit Ojha
##   URL: 
##   Update on: May 25, 2022
##
######################################################################

DC_VERSION=v2.5.0
echo "INSTALLING DOCKER COMPOSE IN YOUR SYSTEM........."
echo " "
sudo curl -SL https://github.com/docker/compose/releases/download/$DC_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
echo " "
echo "VALIDATING THE INSTALLATION....."
echo "`docker-compose -v` - is installed Successfully"
