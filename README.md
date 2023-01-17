# cicd-toolbox created from python-alpine3.17

1. Podman must be installed and the current user must be authorized for using Podman service.
2. Execute build.sh to build the images from internet sources and store new cicd-toolbox image in local repository.
3. Getting the file RC file and certificates to put into same directory than the cicd-toolbox.sh file.
4. Execute the script ./cicd-toolbox.sh

Note : The current local directory is mapped with /etc/cicd-toolbox volume of container to work with heat templates.
