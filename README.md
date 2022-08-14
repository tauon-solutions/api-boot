# api-boot
## Start the api service locally
### boot_local.sh
###### Steps to execute
```bash
cd /var/
sudo git clone https://github.com/tauon-solutions/api-boot
sudo nano /var/api-boot/boot_local.sh
Replace the line 
sudo git clone https://github.com/tauon-solutions/letterla-api
With
sudo git clone **<your private repo letterla-api>**

sudo chmod +777 '/var/api-boot/boot_local.sh'
'/var/api-boot/boot_local.sh'
```
###### Steps in boot_local.sh
  1. Installation
  2. Cloning the Repo
  3. Installing requirements
  4. Initialize postgres
  5. Run Flask API service
