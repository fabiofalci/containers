FROM base/archlinux

RUN pacman -Sy --noconfirm \
	&& pacman -S reflector --noconfirm \
	&& reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist	\
	&& pacman -Su --noconfirm \
	&& pacman-db-upgrade

RUN pacman -S nginx --noconfirm

RUN echo "/usr/bin/nginx -g 'pid /run/nginx.pid; error_log stderr;'" > /start-daemon.sh \
	&& echo "/usr/bin/nginx -g 'pid /run/nginx.pid; error_log stderr; daemon off;'" > /start.sh \
	&& chmod +x /start*.sh
