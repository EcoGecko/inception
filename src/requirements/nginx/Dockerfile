FROM alpine:3.19

RUN apk update
RUN apk upgrade
RUN apk add nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=PT/ST=Porto/L=Porto/O=42/OU=42/CN=heda-sil.42.fr/UID=heda-sil"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/www/html

RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]

# FROM debian:bullseye

# RUN apt update -y
# RUN apt upgrade -y
# RUN apt install -y nginx openssl

# RUN mkdir -p /etc/nginx/ssl
# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=PT/ST=Porto/L=Porto/O=42/OU=42/CN=heda-sil.42.fr/UID=heda-sil"

# COPY conf/nginx.conf /etc/nginx/nginx.conf

# RUN mkdir -p /var/run/nginx

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html

# CMD [ "nginx", "-g", "daemon off;" ]
