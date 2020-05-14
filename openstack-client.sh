#!/bin/bash

set -e

if [[ $(docker ps) ]]; then
        echo "Checking of Docker service : OK"
else
        echo "Checking of Docker service : ERROR because Docker service is unavailable !" && exit 1
fi


if [[ -f "clouds.yaml" ]]; then
        echo "Checking of clouds.yaml : OK"
else
        echo "Checking of clouds.yaml : ERROR because missing file in $PWD directory !" && exit 1
fi

docker run -it --rm -v $PWD:/etc/openstack -e "OS_CLOUD=openstack" --name openstack-client loicmilandre/openstack-client:latest
