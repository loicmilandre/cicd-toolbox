#!/bin/bash

podman import --change "CMD /bin/sh" openstack-client.tar openstack-client
