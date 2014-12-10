FROM base/archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S nginx --noconfirm

RUN echo "/usr/bin/nginx -g 'pid /run/nginx.pid; error_log stderr;'" > /start-daemon.sh \
	&& echo "/usr/bin/nginx -g 'pid /run/nginx.pid; error_log stderr; daemon off;'" > /start.sh \
	&& chmod +x /start*.sh
