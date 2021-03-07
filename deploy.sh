#!/bin/bash

echo "$2" | docker login docker.pkg.github.com -u $1 --password-stdin

docker-compose -f /barinade/barinade-infrastructure/$ENV/docker-compose.yml up -d --force-restart bot

