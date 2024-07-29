# FROM alpine:3.19

# RUN apk update && apk upgrade
# RUN apk add mariadb mariadb-client mariadb-server-utils openrc
# RUN mkdir -p /run/openrc && touch /run/openrc/softlevel
# RUN mkdir -p /var/lib/mysql

# EXPOSE 3306

# COPY ./tools/mariadb_setup.sh /tmp
# COPY ./tools/healthcheck.sh /
# COPY ./conf/mariadb.cnf /etc/my.cnf

# RUN chmod +x /tmp/mariadb_setup.sh
# RUN chmod +x healthcheck.sh

# CMD [ "sh", "/tmp/mariadb_setup.sh" ]
# CMD [ "tail", "-f", "/dev/null" ]

FROM debian:bullseye

EXPOSE 3306

RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server

COPY ./tools/mariadb_setup.sh /tmp
COPY ./tools/healthcheck.sh /
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /tmp/mariadb_setup.sh
RUN chmod +x healthcheck.sh

CMD [ "bash", "/tmp/mariadb_setup.sh" ]
