FROM archlinux-aur

RUN pacman -Syu --noconfirm \
	&& pacman-db-upgrade

RUN pacman -S python2-virtualenv --noconfirm

RUN virtualenv2 venv

RUN source venv/bin/activate \
	&& pacman -S python-pip python2-lxml --noconfirm \
	&& pip install mitmproxy

# activate env before run mitmproxy:
# $ source venv/bin/activate
	
