FROM python:alpine3.11

ENV OS_CLOUD=""

RUN apk update && apk add gcc libffi-dev libssl-dev linux-headers

RUN pip install --upgrade pip

RUN pip install python-openstackclient

RUN pip install python-novaclient \
                python-neutronclient \
                python-glanceclient \
                python-cinderclient \
                python-heatclient \
                python-octaviaclient \
                python-keystoneclient
                
RUN pip install python-barbicanclient \
                python-ceilometerclient \
                python-cloudkittyclient \
                python-designateclient \
                python-fuelclient \
                python-magnumclient \
                python-manilaclient \
                python-mistralclient \
                python-monascaclient \
                python-muranoclient \
                python-saharaclient \
                python-senlinclient \
                python-swiftclient \
                python-troveclient
                #python-gnocchiclient
                
RUN apk del gcc libffi-dev libssl-dev linux-headers && apk cache clean

RUN mkdir /etc/openstack
VOLUME /etc/openstack
WORKDIR /etc/openstack
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "openstack" ]
