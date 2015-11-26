#!/bin/bash

#
# If MacOS, please brew install coreutils
# gdate will be used then instead of date
# ghead will be used then instead of head
#
DATE=$(which gdate)
if [ -z $DATE ]
then
    DATE=/bin/date
fi

HEAD=$(which ghead)
if [ -z $HEAD ]
then
    HEAD=/usr/bin/head
fi

CURRENT_FILE="hdp_urlinfo.json.$($DATE "+%Y-%m-%d")"
PREVIOUS_FILE=$(find . -maxdepth 1 -name "hdp_urlinfo.json.*" | grep -v $CURRENT_FILE | sort | tail -n 1)

status=$(curl -s -o $CURRENT_FILE -w "%{http_code}" http://s3.amazonaws.com/dev.hortonworks.com/HDP/hdp_urlinfo.json)

if [ "$status" -ne "200" ]
then
    echo "Error fetching the hdp_urlinfo"
    exit 1
fi

if [ ! -z $PREVIOUS_FILE -a -f $PREVIOUS_FILE ]
then
    diff -u $PREVIOUS_FILE $CURRENT_FILE
fi

# Keep only two files. 
# workaround | xargs --no-run-if-empty which does not exists in BSD version of xargs.
# see http://stackoverflow.com/a/24105039 for details
var=$(find . -maxdepth 1 -name "hdp_urlinfo.json.*" | sort | $HEAD -n -2)
test "$var" && rm $var