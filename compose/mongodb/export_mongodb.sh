#!/bin/bash

# default database export
network=mongodb_default
mongodb_backup_name=mongodb_mongodb_1

db=news

# get parameters
db=${1:-$db}


docker run --rm \
    -v `pwd`/export_data:/export_data \
    --net ${network} \
    --link ${mongodb_backup_name}:mongodb \
    mongo:3.2 \
    mongodump --host mongodb\
        --archive=/export_data/${db}.`date +%Y-%m-%d"_"%H-%M-%S`.gz --gzip --db ${db}
