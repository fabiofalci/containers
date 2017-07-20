FROM google/cloud-sdk

RUN apt-get -y --no-install-recommends install unzip wget 

RUN wget -q https://github.com/knqyf263/pet/releases/download/v0.2.3/pet_0.2.3_linux_amd64.zip -O pet.zip \
	&& unzip pet.zip \
	&& mv pet /usr/bin

RUN useradd -ms /bin/bash fabio

USER fabio
WORKDIR /home/fabio

RUN mkdir /home/fabio/.ssh

