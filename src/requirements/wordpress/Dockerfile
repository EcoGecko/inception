FROM debian:bullseye

EXPOSE 9000

RUN apt update -y && apt upgrade -y
RUN apt install -y wget curl php-fpm php php-mysql mariadb-client

RUN mkdir -p /var/www/html
RUN mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update

COPY conf/wp-config.php /var/www/html
COPY tools/wordpress_setup.sh /tmp/wordpress_setup.sh 
COPY conf/www.conf /etc/php/7.4/fpm/pool.d
RUN chmod +x /tmp/wordpress_setup.sh

CMD [ "bash", "/tmp/wordpress_setup.sh"]
