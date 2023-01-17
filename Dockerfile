FROM python:alpine3.17

ENV PYTHONWARNINGS="ignore:Unverified HTTPS request"

RUN apk update && apk add --no-cache git \
                                     gcc \
                                     curl \
                                     vim \
                                     jq \
                                     openssl

RUN apk add --no-cache --virtual /tmp/.template_build_deps libc-dev \
                                                           python3-dev \
                                                           libxslt-dev \
                                                           libxml2-dev \
                                                           musl-dev \
                                                           libffi-dev \
                                                           libressl-dev

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

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl             
RUN mv ./kubectl /usr/local/bin/kubectl

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

RUN rm ./get_helm.sh
RUN apk del /tmp/.template_build_deps

RUN mkdir /etc/cicd-toolbox
VOLUME /etc/cicd-toolbox
WORKDIR /etc/cicd-toolbox
ENTRYPOINT [ "/bin/sh" ]
