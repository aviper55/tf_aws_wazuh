#!/bin/bash
set -euo pipefail

# Logging
exec > >(tee /var/log/wazuh-setup.log|logger -t user-data -s 2>/dev/console) 2>&1

# Update and install dependencies
sudo yum update -y
sudo yum install -y docker git curl
sudo systemctl enable docker
sudo systemctl start docker

# Install Docker Compose (v2)
DOCKER_COMPOSE_VERSION="2.29.2"
sudo curl -L "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose

docker --version
docker-compose --version


# Prepare Wazuh Docker environment
cd "$(dirname "$0")/../docker"

sysctl -w vm.max_map_count=262144


# Generate indexer certificates if not present
if [ ! -d ./config/certs ]; then
  mkdir -p ./config/certs
  sudo docker compose -f generate-indexer-certs.yml run --rm generator
fi

# Start Wazuh stack
sudo docker compose up -d

# Enable basic system logging
sudo systemctl enable rsyslog || true
sudo systemctl start rsyslog || true

echo "Wazuh deployment complete. Check /var/log/wazuh-setup.log for details."
