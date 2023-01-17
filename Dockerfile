FROM python:alpine3.17

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
                
RUN apk del gcc libffi-dev musl-dev openssl-dev linux-headers libgcc libstdc++ binutils gmp isl25 libgomp libatomic mpfr4 mpc1 pkgconf

RUN mkdir /etc/openstack
VOLUME /etc/openstack
WORKDIR /etc/openstack
ENTRYPOINT [ "/bin/sh" ]
