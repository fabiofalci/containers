FROM base/archlinux

RUN pacman -Sy --noconfirm \
	&& pacman -S reflector openssl rsync --noconfirm \
	&& reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist	\
	&& pacman-key --refresh-keys \
	&& pacman -Su --noconfirm \
	&& pacman-db-upgrade \
	&& pacman -S base-devel --noconfirm


RUN pacman -S rubygems nodejs python2 --noconfirm

ENV PATH /root/.gem/ruby/2.2.0/bin:$PATH
RUN gem update
RUN gem install jekyll
