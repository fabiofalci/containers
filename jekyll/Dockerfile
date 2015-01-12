FROM base/archlinux

RUN pacman -Sy --noconfirm \
	&& pacman -S reflector --noconfirm \
	&& reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist	\
	&& pacman -Su --noconfirm \
	&& pacman-db-upgrade

RUN pacman -S base-devel rubygems nodejs python2 --noconfirm

ENV PATH /.gem/ruby/2.2.0/bin:$PATH
RUN gem update
RUN gem install jekyll
