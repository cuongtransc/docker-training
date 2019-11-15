#!/bin/bash

CONTAINER_NAME=postgres_postgres_1

COLUMNS=129
LINES=35

# check container exists
docker ps -a | awk '{print $NF}' | grep ${CONTAINER_NAME} &>/dev/null

if [[ $? != 0 ]]; then
    echo "You need to create docker container first"
    echo "Using: docker-compose up -d"
else
    docker logs -f --tail 30 ${CONTAINER_NAME}
fi
