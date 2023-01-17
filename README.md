# openstack-client created from python-alpine3.17

1. Podman must be installed and the current user must be authorized for using Podman service.
2. Execute build.sh to build the images from internet sources and store new openstack-client image in local repository.
3. Getting the file RC file and certificates to put into same directory than openstack-client.sh.
4. Execute the script ./openstack-client.sh

Note : The current local directory is mapped with /etc/openstack volume of container to work with heat templates.
