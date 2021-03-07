#!/bin/bash

echo "$2" | docker login docker.pkg.github.com -u $1 --password-stdin

case $3 in
	master) ENV=prod ;;
	develop) ENV=int ;;
	feature/gh-actions) ENV=int ;;
	*) echo "Branch not supported" && exit 1 ;;
esac

docker-compose pull bot
docker-compose -f /barinade/barinade-infrastructure/$ENV/docker-compose.yml up -d --force-recreate bot

