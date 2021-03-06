#!/bin/bash

# Install Script For Ubuntu 18.04
# Initial software and configuration after installation

# Update Repositories
cd ~
sudo apt-get update -qq
echo '*******************************'
echo "Repositories Have Been Updated"
echo '*******************************'

# Install Packages From Repositories
sudo apt-get install -yy filezilla transmission geary youtube-dl terminator vlc  pidgin clementine gparted hexchat mpv \
filezilla tree htop fslint corebird postgresql postgresql-contrib calibre nfs-common deja-dup net-tools nmap git python-pip \
python3-venv zsh keepass2 clamav firejail mysql-server default-libmysqlclient-dev mysql-workbench gdm3 gnome-session \
gnome-tweak-tool chrome-gnome-shell nemo vim qbittorrent

echo '***********************************************'
echo "Packages Installed From Repositories - COMPLETE"
echo '***********************************************'


echo '*******************************************'
echo "Check Service Status Of Postgres And MySQL"
echo '*******************************************'
sudo systemctl enable mysql
sudo systemctl status mysql --no-pager
sudo systemctl enable postgresql
sudo systemctl status postgresql --no-pager


echo '********************************'
echo "Moving On To Snap Installations"
echo '********************************'

# Snap package installs
sudo snap install slack --classic
sudo snap install pycharm-professional --classic
sudo snap install postman --classic
sudo snap install atom --classic
sudo snap install simplenote --classic
sudo snap install discord --classic
sudo snap install chromium
sudo snap install tusk
sudo snap install spotify
sudo snap install sublime-text --classic
sudo snap install datagrip --classic

echo '*********************************'
echo "Snap Package Installs - COMPLETE"
echo '*********************************'


# Install and Setup Openssh Server
sudo apt-get purge openssh-server
sudo apt-get install -yy openssh-server
sudo apt-get install -yy openvpn
sudo apt-get install -yy network-manager-openvpn-gnome
sudo systemctl enable sshd
sudo systemctl status sshd --no-pager

echo '***************************************'
echo "Openssh Server Installation - COMPLETE"
echo '***************************************'

# Install Pipenv
sudo -H pip3 install pipenv
echo '****************************'
echo "Pipenv Installed - COMPLETE"
echo '****************************'

 
# Minimize GUI Apps Via Dock
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
echo '************************************************'
echo "Minimize GUI Apps Via Dock Configured - COMPLETE"
echo '************************************************'


# Install Arc Theme via PPA
sudo add-apt-repository ppa:noobslab/themes
sudo apt update
sudo apt install -yy arc-theme
echo '************************************'
echo "Installation of Arc Theme - COMPLETE"
echo '************************************'


# Install Python3.4 via PPA
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -yy python3.4
sudo apt install -yy python3.6
sudo apt install -yy python3.7
sudo apt install -yy python3.8
echo '*************************************'
echo "Installation of Python 3.4 - COMPLETE"
echo '*************************************'


# Install UKUU Kernel Manager via PPA
sudo add-apt-repository ppa:teejee2008/ppa
sudo apt-get update
sudo apt-get install -yy ukuu
echo '*******************************'
echo "Installation of UKUU - COMPLETE"
echo '*******************************'


# Change Swapiness
sudo sysctl vm.swappiness=10
echo '*******************************'
echo "Swappiness Changed To Level 10 - COMPLETE"
echo '*******************************'


# Tweak the Following Steps Where Neccessary

# Install and Configure TLP - Laptop Only
sudo apt install -yy tlp 
sudo systemctl enable tlp
sudo systemctl enable tlp-sleep
sudo systemctl mask systemd-rfkill.socket
sudo systemctl mask systemd-rfkill.service
sudo systemctl start tlp
sudo systemctl status tlp --no-pager
sudo systemctl start tlp-sleep
sudo systemctl status tlp-sleep --no-pager
echo '*********************************************'
echo "TLP Installation and Configuration - COMPLETE"
echo '*********************************************'

# Install System76 POP Theme via PPA - Warning Will Prompt To Update Ubuntu Base Via This PPA: Can Turn Off Prompt
sudo add-apt-repository ppa:system76/pop
sudo apt-get update
sudo apt-get install -yy pop-theme
echo '*************************************************'
echo "System76 PPA Added and Pop Theme Added - COMPLETE"
echo '*************************************************'

# Install Timeshift - Back up system, not home directory
sudo add-apt-repository -y ppa:teejee2008/timeshift
sudo apt-get update
sudo apt-get install -yy timeshift
echo '*************************************************'
echo "Timeshift PPA Added and Timeshift Added - COMPLETE"
echo '*************************************************'

# Create Directories For Local Mount Points - Desktop Only
sudo mkdir /mnt/HD1-INT
sudo mkdir /mnt/HD2-INT
sudo mkdir /mnt/HD3-INT
echo '*****************************************'
echo "Creation of Local Mount Points - COMPLETE"
echo '*****************************************'

# Create Directories For NFS Mount Points
sudo mkdir /mnt/nfs-HDD1
sudo mkdir /mnt/nfs-HDD2
sudo mkdir /mnt/nfs-HDD3
sudo mkdir /mnt/nfs-HDD4
echo '***************************************'
echo "Creation of NFS Mount Points - COMPLETE"
echo '***************************************'

echo '*************************************************************************'
echo "Installation and Configuration of Initial Packages Should Now Be Complete"
echo '*************************************************************************'

# Set up pgadmin4
sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
sudo apt update
sudo apt install -yy pgadmin4 pgadmin4-apache2
echo '***************************************'
echo "PgAdmin4 has been installed - COMPLETE"
echo '***************************************'