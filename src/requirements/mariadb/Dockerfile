FROM debian:bullseye

EXPOSE 3306

RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server

COPY ./tools/mariadb_setup.sh /tmp
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /tmp/mariadb_setup.sh

CMD [ "bash", "/tmp/mariadb_setup.sh" ]
