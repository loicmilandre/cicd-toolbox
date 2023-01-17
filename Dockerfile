FROM python:alpine3.17

ENV PYTHONWARNINGS="ignore:Unverified HTTPS request"

RUN apk update && apk add --no-cache git gcc
RUN apk add --no-cache --virtual /tmp/.template_build_deps libc-dev \
                                                           python3-dev \
                                                           libxslt-dev \
                                                           libxml2-dev \
                                                           musl-dev \
                                                           libffi-dev \
                                                           libressl-dev \
                                                           openssl-dev
RUN pip install --upgrade pip
RUN pip install --no-cache-dir setuptools \
                               yamllint \
                               ansible \ 
                               python-openstackclient \
                               python-novaclient \
                               python-neutronclient \
                               python-glanceclient \
                               python-cinderclient \
                               python-heatclient \
                               python-keystoneclient
                
RUN apk del /tmp/.template_build_deps

RUN mkdir /etc/cicd-toolbox
VOLUME /etc/cicd-toolbox
WORKDIR /etc/cicd-toolbox
ENTRYPOINT [ "/bin/sh" ]
