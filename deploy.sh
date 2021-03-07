#!/bin/bash

echo "$2" | docker login docker.pkg.github.com -u $1 --password-stdin

case $(git branch --show-current) in
	master) ENV=prod ;;
	develop) ENV=int ;;
	feature/gh-actions) ENV=int ;;
	*) echo "Building images is only available on master and develop" && exit 1 ;;
esac

docker-compose -f /barinade/barinade-infrastructure/$ENV/docker-compose.yml up -d --force-restart bot

