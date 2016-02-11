FROM ubuntu

RUN apt-get update && apt-get install wget -y

RUN wget http://download.geteventstore.com/binaries/EventStore-OSS-Ubuntu-14.04-v3.4.0.tar.gz \
  && tar xvf EventStore-OSS-Ubuntu-14.04-v3.4.0.tar.gz \
  && rm EventStore*.tar.gz \
  && mv EventStore* eventstore


