#!/bin/bash

HOST=172.17.0.1
PORT=21

USER=lab
PASS=lab@123

# SERVER_DIR=/data
# LOCAL_DIR=/tmp/new


lftp -f "
open $HOST $PORT
user $USER $PASS

ls
bye
"

# mirror --delete --verbose $SERVER_DIR $LOCAL_DIR

# lcd $LOCAL_DIR

