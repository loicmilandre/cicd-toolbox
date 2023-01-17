#!/bin/bash

podman run -it --rm -v $PWD:/etc/cicd-toolbox --security-opt label=disable --name cicd-toolbox-$USER cicd-toolbox:latest

