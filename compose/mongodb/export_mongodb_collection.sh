#!/bin/bash

# default database export
network=mongodb_default
mongodb_backup_name=mongodb_mongodb_1

if [ $# -ne 2 ]; then
    echo "Use: ./export_mongodb_collection.sh <db-name> <collection-name>"
    exit 1
fi

# get parameters
db=$1
collection=$2

docker run --rm \
    -v `pwd`/export_data:/export_data \
    --net ${network} \
    --link ${mongodb_backup_name}:mongodb \
    mongo:3.2 \
    mongodump --host mongodb\
        --archive=/export_data/${db}_${collection}.`date +%Y-%m-%d"_"%H-%M-%S`.gz --gzip --db ${db} --collection ${collection}

