FROM base/archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S base-devel --noconfirm

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN cd /tmp && curl https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz -0 | tar -zx \
	&& cd package-query \
	&& makepkg -s --asroot  --noconfirm \
	&& pacman -U package-query-1.4-1-x86_64.pkg.tar.xz --noconfirm \
	&& rm -rf /tmp/package-query

RUN cd /tmp && curl https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz -0 | tar -zx \
	&& cd yaourt \
	&& makepkg -s --asroot  --noconfirm \
	&& pacman -U yaourt-1.5-1-any.pkg.tar.xz --noconfirm \
	&& rm -rf /tmp/yaourt

