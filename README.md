# Local Area Network as a Party as a Service (LANaaPaaS)
LAN Party Setup Documents, Scripts, and Docker Files


# Quick Start
Each game directory has a make file that will perform the following:
* `make build` - Build a local image of the containers using the docker file
* `make run` - Pull the container, if needed, and run it
* `make stop` - Stop the corresponding container
* `make start` - Start a container that was run once
* `make restart` - Stop then start the container
* `make clean` - Remove the container

To just get something running right away, clone the project and execute `make run`

All containers will mount the config files in the game directory when they launch. You can modify the config files and run `make restart` to restart the containers with updated configs.


# Server Setup
This project has been tested to build an run on Ubuntu 18.04.1 but should work in most Linux enviornments with docker. The following captures all steps from a fresh install of Ubuntu to server running.
**TODO:** Automate OS install via preseeding or kickstart?

## OS Install
**Ubuntu Desktop:** 18.04.1

**Install Options:**
* Minimal installation
  * Download updates while installing Ubuntu: Yes
  * Install third-party software for grapics and Wi-Fi hardware and addtional media formats
* Erase disk and install Ubuntu
  * Encrypt the new Ubuntu installation for security: No
  * Use LVM ith the new Ubuntu installation: No

## Update
```
sudo apt update  
sudo apt upgrade  
sudo reboot  
```

## Addtional SW and Tools
```
sudo apt install vim ssh make
```

## Docker Setup
**Note:** Using verson from Ubuntu's repo. Not latest docker-ce
```
sudo apt install docker.io  
sudo systemctl enable docker  
sudo usermod -aG docker <user>  
sudo reboot  
```

# Games

## CSGO
https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers


## Teeworlds 0.7.2
Stuggling to get the steam client working in Windows 10. Use direct download instead.
https://www.teeworlds.com/?page=downloads


## Track Mania
Fix for running in steam on windows 10 found here.
https://steamcommunity.com/sharedfiles/filedetails/?id=448953593


## Chivalry
Built based on cm2network/steamcmd container and instructions form thread below.
https://forums.tornbanner.com/topic/21416/native-linux-server-available/

Sever configuration is better documented here.
https://forums.tornbanner.com/topic/7805/dedicated-server-download-and-configuration-guide


