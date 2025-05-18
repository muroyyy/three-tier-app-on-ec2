#!/bin/bash

# Update and install required packages
apt update -y
apt install -y docker.io curl snapd

# Install and start Amazon SSM Agent (required for Session Manager)
snap install amazon-ssm-agent --classic
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent

# Enable and start Docker
systemctl enable docker
systemctl start docker

# Add 'ubuntu' user to Docker group (skip if EC2 username is different)
usermod -aG docker ubuntu

# Install Docker Compose v2 (binary method)
curl -SL https://github.com/docker/compose/releases/download/v2.24.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Navigate to app directory and run containers
cd /home/ubuntu/three-tier-app-on-ec2 || exit
docker-compose up -d
