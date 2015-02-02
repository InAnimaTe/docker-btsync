#!/bin/bash

if [ "$SECRET" == "false" ]; then
    SECRET=`btsync --generate-secret`
fi

HOSTNAME=`hostname -f`

sed -i "s/MY_SERVER_1/$HOSTNAME/" /btsync/btsync.conf
sed -i "s/MY_SECRET_1/$SECRET/" /btsync/btsync.conf
##echo "Starting btsync with secret: $SECRET"

/usr/local/bin/btsync --nodaemon --config /btsync/btsync.conf
