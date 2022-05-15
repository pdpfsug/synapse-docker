#!/usr/bin/bash

# Export the environment variables
for var in $(cat .env); do
  export $var
done

# Create config files
envsubst < coturn/turnserver.conf.example > coturn/turnserver.conf
envsubst < nginx/nginx.conf.example > nginx/nginx.conf
envsubst < synapse/homeserver.yaml.example > synapse/homeserver.yaml
