#!/bin/sh
#################
# Installation
#################
echo "1. Installation started"
sudo apt-get update
sudo apt install -y apache2 python3-pip postgresql postgresql-contrib
echo "1. Installation completed"


#################
# Cloning the Repo
#################
echo "2. Cloning the Repo from Github"
cd /var/www/
sudo git clone https://ratan.vanjani%40tauon.in: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@github.com/tauon-solutions/letterla-api
sudo chmod 777 -R letterla-api/
cd /var/www/letterla-api/

#################
# Installing requirements
#################
echo "3. Installing requirements"
sudo pip3 install -r /var/www/letterla-api/requirements.txt

#################
# Initialize postgres
#################
echo "4. Initialize postgres"
sudo chmod +777 '/var/www/letterla-api/scripts/installation/postgres.sh'
'/var/www/letterla-api/scripts/installation/postgres.sh

#################
# Run Flask API service
#################
echo "5. Run Flask API Service"
flask db upgrade
flask run
