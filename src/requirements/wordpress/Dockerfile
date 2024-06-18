FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add wget curl php-fpm php php-phar php-mysqli mariadb-client

RUN mkdir -p /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update

# COPY conf/wp-config.php /var/www/html
COPY tools/index.html /var/www/html
COPY tools/wordpress_setup.sh /tmp/wordpress_setup.sh 
RUN chmod +x /tmp/wordpress_setup.sh

CMD ["sh", "/tmp/wordpress_setup.sh"]
