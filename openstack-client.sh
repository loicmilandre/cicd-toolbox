#!/bin/bash

podman run -it --rm -v $PWD:/etc/openstack --security-opt label=disable --name openstack-client-$USER openstack-client:latest

