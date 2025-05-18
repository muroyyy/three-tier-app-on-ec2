#!/bin/bash
# Ensure all commands run as root (add sudo if needed)

apt-get update -y
apt-get upgrade -y

# Install Docker
apt-get install -y docker.io

# Enable and start Docker
systemctl enable docker
systemctl start docker

# Add user to docker group (optional)
usermod -aG docker ubuntu

# Install Docker Compose (v2)
curl -SL https://github.com/docker/compose/releases/download/v2.24.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Verify installation (will show up in cloud-init logs)
docker --version
docker-compose version
