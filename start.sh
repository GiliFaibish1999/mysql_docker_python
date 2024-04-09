#!/usr/bin/env bash -x

docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
docker image rm $(docker image ls -aq) 
docker volume prune -f
docker-compose up -d mysql
sh ./wait.sh
docker-compose up -d pythonapp pythonapp2 pythonapp3
