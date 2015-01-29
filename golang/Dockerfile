FROM base/archlinux

RUN pacman -Sy --noconfirm \
	&& pacman -S reflector --noconfirm \
	&& reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist	\
	&& pacman -Su --noconfirm \
	&& pacman-db-upgrade

RUN pacman -S base-devel curl mercurial git --noconfirm

RUN curl -sSL https://storage.googleapis.com/golang/go1.3.3.linux-amd64.tar.gz | tar -v -C /usr/local -xz

ENV GOPATH /go
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin
