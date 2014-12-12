FROM base/archlinux

RUN pacman -Sy --noconfirm \
	&& pacman -S reflector --noconfirm \
	&& reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist	\
	&& pacman -Su --noconfirm
	
RUN pacman -S sudo postgresql --noconfirm
RUN sudo -u postgres initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'

RUN echo "sudo -u postgres pg_ctl -D /var/lib/postgres/data -l /tmp/postgres.log start" > /start.sh && chmod +x /start.sh \
	&& echo "sudo -u postgres pg_ctl -D /var/lib/postgres/data -l /tmp/postgres.log -m fast stop" > /stop.sh && chmod +x /stop.sh

RUN /start.sh && sleep 5 \
	&& sudo -u postgres createuser -s admin \
	&& sudo -u postgres createdb test-db \
	&& sudo -u postgres psql -c "ALTER USER admin WITH PASSWORD 'admin';" \
	&& /stop.sh && sleep 5

RUN echo "listen_addresses = '*'" >> /var/lib/postgres/data/postgresql.conf \
	&& echo "host all all 0.0.0.0/0 md5" >> /var/lib/postgres/data/pg_hba.conf

