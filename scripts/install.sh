#!/bin/bash
apt update -y
apt install -y docker.io docker-compose nginx curl git

usermod -aG docker ubuntu
systemctl enable docker
systemctl start docker

ufw allow 'Nginx Full'

# Optional: Clone your app repo and run docker-compose
# cd /home/ubuntu && git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
# cd YOUR_REPO && docker-compose up -d
