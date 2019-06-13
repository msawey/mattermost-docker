#!/usr/bin/env bash

docker-compose down

if [ ! -d "volumes" ]; then
   docker-compose build
   mkdir -pv ./volumes/app/mattermost/{data,logs,config,plugins,client-plugins}
   chown -R 2000:2000 ./volumes/app/mattermost/
   docker-compose up -d
else
    docker-compose up -d
fi
