#!/bin/bash

docker run -it --rm -v $PWD:/etc/openstack -e "OS_CLOUD=openstack" --name openstack-client loicmilandre/openstack-client:latest
