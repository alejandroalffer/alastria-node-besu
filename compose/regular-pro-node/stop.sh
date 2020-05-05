#!/bin/bash
# Set the BESU_P2P_HOST environment variable to the public IP address of your node
export BESU_P2P_HOST=`dig +short myip.opendns.com @resolver1.opendns.com 2>/dev/null || curl -s --retry 2 icanhazip.com`

# Set the ORION_NODEURL environment variable to the public IP of your node
export ORION_NODEURL="http://"$BESU_P2P_HOST":8080/"

# Start containers
docker-compose down
