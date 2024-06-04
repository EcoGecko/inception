FROM alpine:3.19

RUN apk update && apk upgrade
RUN apk add wget php-fpm
RUN wget https://wordpress.org/wordpress-6.4.2.tar.gz -P /var/www
RUN cd /var/www/ && tar -xzvf wordpress-6.4.2.tar.gz && rm wordpress-6.4.2.tar.gz

# CMD ["php-fpm82", "-F"]
