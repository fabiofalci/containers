FROM base/archlinux

RUN pacman -Sy --noconfirm \
	&& pacman -S reflector --noconfirm \
	&& reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist	\
	&& pacman -Su --noconfirm \
	&& pacman -S base-devel --noconfirm

RUN pacman -S rubygems nodejs python2 --noconfirm

ENV PATH /.gem/ruby/2.1.0/bin:$PATH
RUN gem update
RUN gem install jekyll

