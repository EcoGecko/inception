FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add wget curl php-fpm php php-phar php-mysqli mariadb-client
# RUN wget https://wordpress.org/wordpress-6.4.2.tar.gz -P /var/www
# RUN cd /var/www/ && tar -xzvf wordpress-6.4.2.tar.gz && rm wordpress-6.4.2.tar.gz

RUN mkdir -p /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp cli update

COPY tools/wordpress_setup.sh /tmp/wordpress_setup.sh 
RUN chmod +x /tmp/wordpress_setup.sh

CMD ["sh", "/tmp/wordpress_setup.sh"]
