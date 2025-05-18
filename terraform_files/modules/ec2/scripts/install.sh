#!/bin/bash

apt update -y
apt install -y docker.io curl

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

# Optional: Install Docker Compose v2
curl -SL https://github.com/docker/compose/releases/download/v2.24.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Run your container stack
cd /home/ubuntu/three-tier-app-on-ec2 || exit
docker-compose up -d
