FROM ubuntu:18.04

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt update -y && \
    apt install -y \
        supervisor \
        procps \
        python3-pip \
        python3-setuptools \
        python3-vobject \
        python3-watchdog \
        python3-psycopg2 \
        python3-psutil \
        python3-suds \
        supervisor \
        xz-utils \
        apt-utils \
        curl

# install latest postgresql-client
RUN set -x; \
        echo 'deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main' > /etc/apt/sources.list.d/pgdg.list \
        && export GNUPGHOME="$(mktemp -d)" \
        && repokey='B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8' \
        && gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "${repokey}" \
        && gpg --armor --export "${repokey}" | apt-key add - \
        && gpgconf --kill all \
        && rm -rf "$GNUPGHOME" \
        && apt-get update  \
        && apt-get install -y postgresql-client \
        && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' --uid 1002 rxclinic
RUN usermod -aG sudo -s /bin/bash rxclinic
RUN echo "rxclinic ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir -p /var/log/supervisor
RUN pip3 install django==3.0
RUN pip3 install djangorestframework==3.11.0