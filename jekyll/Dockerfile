FROM base/archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S base-devel rubygems nodejs python2 --noconfirm

ENV PATH /.gem/ruby/2.1.0/bin:$PATH
RUN gem update
RUN gem install jekyll

