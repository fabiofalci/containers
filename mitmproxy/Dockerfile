FROM archlinux-aur

RUN pacman -Syu --noconfirm \
	&& pacman-db-upgrade
	
RUN  sudo -u pacman yaourt -S mitmproxy-git --noconfirm

