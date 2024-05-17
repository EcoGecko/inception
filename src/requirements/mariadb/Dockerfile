FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client

EXPOSE 3306

COPY ./tools/mariadb_setup.sh /tmp

RUN chmod +x /tmp/mariadb_setup.sh

# # CMD [ "sh", "/tmp/mariadb_setup.sh" ]

# FROM debian:11

# RUN apt-get update && apt-get upgrade
# RUN apt-get install -y mariadb-server

# COPY ./tools/mariadb_setup.sh /tmp/mariadb_setup.sh

# RUN chmod +x /tmp/mariadb_setup.sh
