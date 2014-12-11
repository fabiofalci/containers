FROM golang

RUN pacman -Syu --noconfirm

# Go Cross Compilation
RUN go get github.com/mitchellh/gox \
	&& gox -build-toolchain
