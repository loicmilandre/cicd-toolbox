FROM python:alpine3.11

ENV OS_CLOUD=""

RUN apk update && apk add gcc

RUN pip install --upgrade pip

RUN pip install python-openstackclient python-heatclient python-neutronclient

RUN pip install python-novaclient \
                python-neutronclient \
                python-glanceclient \
                python-cinderclient \
                python-heatclient \
                python-octaviaclient \
                python-keystoneclient

RUN mkdir /etc/openstack
VOLUME /etc/openstack
WORKDIR /etc/openstack
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "openstack" ]
