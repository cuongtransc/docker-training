#!/bin/bash

# default database export
network=mongodb_default
mongodb_backup_name=mongodb_mongodb_1

db=crawler

# get parameters
filename=${1}
filename=`readlink -f ${filename}`

db=${2:-$db}

docker run --rm \
    -v ${filename}:/import_data.gz:ro \
    --net ${network} \
    --link ${mongodb_backup_name}:mongodb \
    mongo:3.2 \
    mongorestore --host mongodb\
        --archive=/import_data.gz --gzip --db ${db}
