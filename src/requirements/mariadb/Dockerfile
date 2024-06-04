FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client mariadb-server-utils openrc
RUN mkdir -p /run/openrc && touch /run/openrc/softlevel
RUN mkdir -p /var/lib/mysql

EXPOSE 3306

COPY ./tools/mariadb_setup.sh /tmp

RUN chmod +x /tmp/mariadb_setup.sh

CMD [ "sh", "/tmp/mariadb_setup.sh" ]
