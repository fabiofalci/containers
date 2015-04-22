FROM base/archlinux

RUN pacman -Sy --noconfirm \
	&& pacman -S reflector --noconfirm \
	&& reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist	\
	&& pacman-key --refresh-keys \
	&& pacman -Su --noconfirm \
	&& pacman-db-upgrade \
	&& pacman -S base-devel --noconfirm

LC_ALL ENV en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN useradd -r -s /usr/bin/nologin pacman \
	&& echo 'pacman ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
	&& cd /tmp \
	&& sudo -u pacman bash -c 'curl https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz -0 | tar -zx' \
	&& cd package-query \
	&& sudo -u pacman makepkg -s --noconfirm \
	&& pacman -U package-query-*.pkg.tar.xz --noconfirm \
	&& rm -rf /tmp/package-query \
	&& cd /tmp \
	&& sudo -u pacman bash -c 'curl https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz -0 | tar -zx' \
	&& cd yaourt \
	&& sudo -u pacman makepkg -s --noconfirm \
	&& pacman -U yaourt-*.pkg.tar.xz --noconfirm \
	&& rm -rf /tmp/yaourt

