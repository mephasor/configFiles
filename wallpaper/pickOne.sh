#!/bin/bash

# make sure feh is installed
if ! command -v &> /dev/null
then
    echo "feh could not be found"
    exit
fi

IMG_PATH="`dirname $(readlink -f "$0")`/abstract/*.png"
MY_IMG=`(ls -d $IMG_PATH | sort -R | tail -n 1)`
feh --bg-scale $MY_IMG
