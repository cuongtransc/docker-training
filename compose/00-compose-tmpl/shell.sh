#!/bin/bash

CONTAINER_NAME=app_app_1

COLUMNS=129
LINES=35

# check container exists
docker ps -a | awk '{print $NF}' | grep ${CONTAINER_NAME} &>/dev/null

if [[ $? != 0 ]]; then
    echo "You need to create docker container first"
    echo "Using: docker-compose up -d"
else
    # check container is running
    docker ps | awk '{print $NF}' | grep ${CONTAINER_NAME} &>/dev/null

    if [[ $? != 0 ]]; then
        echo "Start ${CONTAINER_NAME}"
        docker start ${CONTAINER_NAME}
    fi

    #docker exec -it ${CONTAINER_NAME} sh -c "stty cols $COLUMNS rows $LINES && sh";
    docker exec -it ${CONTAINER_NAME} bash -c "stty cols $COLUMNS rows $LINES && bash";
fi

