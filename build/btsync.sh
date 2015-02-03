#!/bin/bash

## Handle an empty secret
if [ "$SECRET" == "false" ]; then
    SECRET=`btsync --generate-secret`
fi

## Set the hostname to that of the container (will be the or whatever you set it to via --hostname)
HOSTNAME=`hostname -f`

## Set our directory
: ${SYNC_DIR:=/data}

sed -i "s/MY_SERVER_1/$HOSTNAME/" /btsync/btsync.conf
sed -i "s/MY_SECRET_1/$SECRET/" /btsync/btsync.conf
sed -i "s#MY_DIRECTORY_1#$SYNC_DIR#" /btsync/btsync.conf

echo "Starting btsync on directory $SYNC_DIR with secret: $SECRET"

/usr/local/bin/btsync --nodaemon --config /btsync/btsync.conf
