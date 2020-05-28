FROM python:alpine3.11

ENV PYTHONWARNINGS="ignore:Unverified HTTPS request"

RUN apk update && apk add gcc libffi-dev musl-dev openssl-dev linux-headers bash

RUN pip install --upgrade pip

RUN pip install python-openstackclient

RUN pip install python-novaclient \
                python-neutronclient \
                python-glanceclient \
                python-cinderclient \
                python-heatclient \
                python-keystoneclient
                
RUN pip install python-barbicanclient \
                python-octaviaclient \
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
                
RUN apk del gcc libffi-dev musl-dev openssl-dev linux-headers libgcc libstdc++ binutils gmp isl libgomp libatomic mpfr4 mpc1 pkgconf

RUN mkdir /etc/openstack
VOLUME /etc/openstack
WORKDIR /etc/openstack
ENTRYPOINT [ "/bin/sh" ]
