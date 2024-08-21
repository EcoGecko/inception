#!/bin/bash

print_green() {
  echo -e "\e[32m$1\e[0m"
}

print_red() {
  echo -e "\e[31m$1\e[0m"
}

sleep 1

wp core download --path='/var/www/html' --allow-root
print_green "downloaded wordpress"


wp core config --dbname=$SQL_DATABASE \
  --dbuser=$WP_USER \
  --dbpass=$WP_PASSWORD \
  --dbhost=$SQL_HOST \
  --path='/var/www/html' \
  --allow-root

if ! wp core is-installed --path='/var/www/html' --allow-root; then
  wp core install --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL \
    --skip-email \
    --path='/var/www/html' \
    --allow-root

	print_green "finished wordpress configuration"

else
	print_red "wordpress already configured"
fi

if ! wp user list --field=user_login  --path='/var/www/html' --allow-root | grep -q "^$WP_USER$"; then
  	wp user create 	$WP_USER $WP_USER_EMAIL \
			   		--role=author \
					--user_pass=$WP_PASSWORD \
					--path='/var/www/html' \
					--allow-root
	
		print_green "created user $WP_USER"

else
	print_red "user $WP_USER already exists"
fi

# launch php-pfm
/usr/sbin/php-fpm82 -F
