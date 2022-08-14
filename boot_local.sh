#!/bin/sh
#################
# Formatting declaration
#################
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD=$(tput bold)
NORM=$(tput sgr0)

#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37

#################
# Installation
#################
echo "${CYAN}===> 1. Installation started${NC}"
sudo apt-get update
sudo apt install -y apache2 python3-pip postgresql postgresql-contrib
echo "${CYAN}===> 1. Installation completed${NC}"

#################
# Cloning the Repo
#################
echo "${CYAN}===> 2. Cloning the Repo from Github${NC}"
cd /var/www/
sudo git clone https://github.com/tauon-solutions/letterla-api
sudo chmod 777 -R letterla-api/
cd /var/www/letterla-api/

#################
# Installing requirements
#################
echo "${CYAN}===> 3. Installing requirements${NC}"
sudo pip3 install -r /var/www/letterla-api/requirements.txt

#################
# Initialize postgres
#################
echo "${CYAN}===> 4. Initialize postgres${NC}"
sudo chmod +777 '/var/www/letterla-api/scripts/installation/postgres.sh'
'/var/www/letterla-api/scripts/installation/postgres.sh'

#################
# Run Flask API service
#################
echo "${CYAN}===> 5. Run Flask API Service${NC}"
flask db upgrade
flask run
