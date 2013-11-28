FROM ubuntu:precise

MAINTAINER Fabio Falci "fabiofalci@gmail.com"

RUN echo 'deb mirror://mirrors.ubuntu.com/mirrors.txt precise main universe multiverse' > /etc/apt/sources.list && apt-get update

RUN apt-get install -y vim build-essential python-pip python-dev libxml2-dev libxslt-dev
RUN pip install mitmproxy

RUN echo 'LANG=en_US.UTF-8' > /etc/locale.conf && echo 'export LANG="en_US.UTF-8"' >> /etc/profile
