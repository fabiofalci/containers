FROM base/archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S go mercurial git --noconfirm

ENV GOPATH /go
ENV PATH $PATH:/go/bin
