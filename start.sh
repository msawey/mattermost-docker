#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Please use sudo"
  exit
fi

docker-compose down

if [ ! -d "volumes" ]; then
   docker-compose build
   mkdir -pv ./volumes/app/mattermost/{data,logs,config,plugins,client-plugins}
   mkdir -pv ./volumes/app/mattermost/data/emoji
   cp /home/msawey/mattermost-docker/data/config/data.jsonl /home/msawey/mattermost-docker/volumes/app/mattermost/config
   cp ./data/emoji/* ./volumes/app/mattermost/data/emoji
   chown -R 2000:2000 ./volumes/app/mattermost/
   docker-compose up -d
else
    docker-compose up -d
fi
