FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
 
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential
RUN apt-get -y install clojure
RUN apt-get -y install curl
RUN apt-get -y install git
RUN curl -O https://download.clojure.org/install/linux-install-1.10.2.774.sh
RUN chmod +x linux-install-1.10.2.774.sh
RUN ./linux-install-1.10.2.774.sh
RUN apt install -y python3-pip
RUN apt install -y htop
RUN pip3 install pyyaml
RUN apt-get update && apt-get -yq install \
    ca-certificates \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libncurses5-dev \
    libreadline6-dev \
    libsqlite3-dev \
    libssl-dev \
    libgdbm-dev \
    tk-dev \
    lzma \
    lzma-dev \
    libffi-dev \
    uuid-dev \
    xvfb \
    lcov
RUN apt-get install -y gdb

ENV LD_LIBRARY_PATH=/opt/openssl
ENV PYTHONPATH=/usr/local/lib/python3.8/dist-packages
ENV SSL_CERT_DIR=/etc/ssl/certs
COPY . /opt/openssl

WORKDIR /opt/openssl
RUN cd /opt/openssl \
    && ./config -d
CMD cd /opt/openssl \
    && make -j5