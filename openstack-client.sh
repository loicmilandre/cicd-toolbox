#!/bin/bash

set -e

function system_check {
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
}

function run_client {
        OSCLOUD=$1
	CMD=$2
        docker run -it --rm -v $PWD:/etc/openstack -e "OS_CLOUD=$OSCLOUD" --name openstack-client-$USER loicmilandre/openstack-client:latest $CMD
}

function usage {
	echo "Usage: ./openstack-client.sh"
	echo "-h : display help info"
	echo "-c [cloud name] : connect to the target cloud defined by cloud name within in clouds.yaml file" 
}

while true; do 
    case "$1" in 
        -c) if [ -z $2 ]; then echo "Missing cloud name" && exit 1; fi
                system_check
		run_client $2 $3
		break
		;;
	-h) usage
    		exit 0
       		;;
	*)  usage
		exit 0
		;;
    esac
done
