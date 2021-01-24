#!/bin/bash

MODELS=("demucs.th" "demucs_extra.th" "tasnet.th" "tasnet_extra.th")
BASE_URL="https://dl.fbaipublicfiles.com/demucs/v2.0"

if [ ! -d models ]
then
    echo "Models dir doesn't exist, creating"
    mkdir models
fi

if [ ! -d separated ]
then
    echo "Separated dir doesn't exist, creating"
    mkdir separated
fi

if [ ! -d songs ]
then
    echo "Songs dir doesn't exists, creating"
    mkdir songs
fi 

# SELinux property must be configured for the container to work
chcon -R -t container_file_t separated
chcon -R -t container_file_t songs

cd models
for m in ${MODELS[@]}
do
    if [ ! -f $m ]
    then
        wget "$BASE_URL/$m"
    fi
done
cd ..
# This is to make sure that all files have 
# the proper SELinux context
chcon -R -t container_file_t models
