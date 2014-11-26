FROM base/archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S sudo postgresql --noconfirm
RUN sudo -u postgres initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'

RUN echo "sudo -u postgres pg_ctl -D /var/lib/postgres/data -l /tmp/postgres.log start" > /start.sh && chmod +x /start.sh

RUN ./start.sh && sleep 5 \
	&& sudo -u postgres createuser -s admin \
	&& sudo -u postgres createdb test-db \
	&& sudo -u postgres psql -c "ALTER USER admin WITH PASSWORD 'admin';" \
	&& sudo -u postgres pg_ctl -D /var/lib/postgres/data -l /tmp/postgres.log stop && sleep 5

RUN echo "listen_addresses = '*'" >> /var/lib/postgres/data/postgresql.conf && echo "host all all 0.0.0.0/0 md5" >> /var/lib/postgres/data/pg_hba.conf

