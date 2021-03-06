#!/usr/bin/bash

# Some variables for nginx
export REMOTE_ADDR="\$remote_addr"
export SCHEME="\$scheme"
export HOST="\$host"

# Export the environment variables
for var in $(cat .env); do
  export $var
done

# Create config files
envsubst < coturn/turnserver.conf.example > coturn/turnserver.conf
envsubst < nginx/nginx.conf.example > nginx/nginx.conf

# Run twice since the generation command overwrites some configs (turn server)
envsubst < synapse/homeserver.yaml.example > synapse/homeserver.yaml
docker-compose run synapse migrate_config
envsubst < synapse/homeserver.yaml.example > synapse/homeserver.yaml
