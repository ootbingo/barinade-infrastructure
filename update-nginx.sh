#!/bin/bash
git pull
cp nginx.conf /barinade/volumes/nginx/app.conf
docker-compose restart barinade-nginx
