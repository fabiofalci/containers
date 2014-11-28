FROM base/archlinux

RUN pacman -Sy --noconfirm \
	&& pacman -S reflector --noconfirm \
	&& reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist	\
	&& pacman -Su --noconfirm \
	&& pacman -S base-devel --noconfirm

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN cd /tmp \
	&& curl https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz -0 | tar -zx \
	&& cd package-query \
	&& makepkg -s --asroot  --noconfirm \
	&& pacman -U package-query-*.pkg.tar.xz --noconfirm \
	&& rm -rf /tmp/package-query \
	&& cd /tmp \
	&& curl https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz -0 | tar -zx \
	&& cd yaourt \
	&& makepkg -s --asroot  --noconfirm \
	&& pacman -U yaourt-*.pkg.tar.xz --noconfirm \
	&& rm -rf /tmp/yaourt

