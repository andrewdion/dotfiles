#!/bin/bash

# $dir must not include trailing slash!
dir=$1

# can be either "local" or "remote"
location=$2

if [ "$location" == "local" ]; then
    host="arch1";
elif [ "$location" == "remote" ]; then
    host="andrewdion.ddns.com";
fi

# GO!
rsync -av --exclude="*git*" ${dir} ${host}:/srv/http/
