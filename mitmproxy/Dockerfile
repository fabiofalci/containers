FROM stackbrew/debian:7.2

MAINTAINER Fabio Falci "fabiofalci@gmail.com"

RUN apt-get update && apt-get -y install libffi-dev python-dev python-pip libxml2-dev libxslt-dev
RUN pip install mitmproxy

RUN echo 'LANG=en_US.UTF-8' > /etc/locale.conf && echo 'export LANG="en_US.UTF-8"' >> /etc/profile
RUN echo 'source /etc/profile\nmitmproxy -p 3128' > /start.sh && chmod +x /start.sh
