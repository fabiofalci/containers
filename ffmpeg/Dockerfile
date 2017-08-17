from jrottenberg/ffmpeg

RUN apt-get update && apt-get upgrade -y 

RUN apt-get install -y software-properties-common dirmngr

RUN apt-add-repository 'deb http://shaggytwodope.github.io/repo ./' && apt-key update && apt-get update -y

RUN apt-get install -y --allow-unauthenticated drive

COPY run.sh /root/run.sh

