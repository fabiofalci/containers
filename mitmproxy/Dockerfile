FROM archlinux-aur

RUN pacman -Syu --noconfirm \
	&& pacman-db-upgrade
	
RUN yaourt -S mitmproxy --noconfirm

