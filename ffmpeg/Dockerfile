from jrottenberg/ffmpeg

RUN apt-get update && apt-get upgrade -y 

RUN apt-get install -y software-properties-common dirmngr vim

RUN apt-add-repository 'deb http://shaggytwodope.github.io/repo ./' && apt-key update && apt-get update -y

RUN apt-get install -y --allow-unauthenticated drive

COPY run.sh /root/run.sh

# docker build -t ffmpeg . 
# docker volume create movies
# docker run -it -v movies:/movies --rm --entrypoint='bash' ffmpeg 
# to pull from google drive 
# drive init /movies
# <path> $ drive pull 
# 
# docker run -d -v movies:/movies --entrypoint='bash' --rm -w '/movies/Images/<path>' --name <name> ffmpeg /root/run.sh
# 
# can check volume content 
# docker run -it -v movies:/movies --rm --entrypoint='bash' ffmpeg 
# <path> $ drive push -files 

