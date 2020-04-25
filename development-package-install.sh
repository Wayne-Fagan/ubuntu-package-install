#!/bin/bash

# Install Script For Development Package Installation

# Update Repositories
cd ~
sudo apt-get update -qq

echo '******************************'
echo "Repositories Have Been Updated"
echo '******************************'

# Install Python Packages
sudo -H pip3 install awscli awsebcli docker-compose pipenv

echo '**************************************'
echo "Python Package Installation - COMPLETE"
echo '**************************************'

# Install Docker - Needs Restart In Order To Complete Setup
sudo apt-get install -yy docker.io
sudo usermod -aG docker ${USER}
sudo systemctl enable docker
sudo systemctl status docker --no-pager

echo '***********************************************'
echo "Docker Installation - COMPLETE - Needs Restart!"
echo '***********************************************'

# Install Go
sudo snap install go --classic

echo '**************************************'
echo "GO Installation - COMPLETE"
echo '**************************************'

# Download Latest Terraform
echo "Download Terraform - Latest version may not be compatible with Giant Terraform"
