FROM debian:bullseye

EXPOSE 3306

RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server

COPY ./tools/mariadb_setup.sh /tmp
RUN chmod +x /tmp/mariadb_setup.sh

ENTRYPOINT [ "/tmp/mariadb_setup.sh" ]
CMD [ "mysqld_safe", "--bind-address=0.0.0.0" ]
