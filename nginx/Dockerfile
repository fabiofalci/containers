FROM base/archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S nginx --noconfirm

RUN echo "/usr/bin/nginx -g 'pid /run/nginx.pid; error_log stderr;'" > /start.sh \
	&& chmod +x /start.sh
