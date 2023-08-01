#!/bin/bash

echo "$2" | sudo docker login docker.pkg.github.com -u $1 --password-stdin

case $3 in
	master) ENV=prod ;;
	main) ENV=prod ;;
	develop) ENV=int ;;
	*) echo "Branch not supported" && exit 1 ;;
esac

sudo -u \#1000 docker compose -f /barinade/barinade-infrastructure/$ENV/docker-compose.yml pull bot
sudo -u \#1000 docker compose -f /barinade/barinade-infrastructure/$ENV/docker-compose.yml up -d --force-recreate bot

