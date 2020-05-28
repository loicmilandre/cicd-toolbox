#!/bin/bash

docker run -it --rm -v $PWD:/etc/openstack --name openstack-client-$USER loicmilandre/openstack-client:latest

