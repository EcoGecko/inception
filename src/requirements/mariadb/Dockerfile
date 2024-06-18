FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client mariadb-server-utils openrc
RUN mkdir -p /run/openrc && touch /run/openrc/softlevel
RUN mkdir -p /var/lib/mysql

EXPOSE 3306

COPY ./tools/mariadb_setup.sh /tmp
COPY ./tools/healthcheck.sh /
COPY ./conf/mariadb.cnf /etc/my.cnf.d/mariadb.cnf

RUN chmod +x /tmp/mariadb_setup.sh
RUN chmod +x healthcheck.sh

CMD [ "sh", "/tmp/mariadb_setup.sh" ]
