FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client

EXPOSE 3306

COPY ./tools/mariadb_setup.sh /tmp

RUN chmod +x /tmp/mariadb_setup.sh

CMD [ "sh", "/tmp/mariadb_setup.sh" ]
