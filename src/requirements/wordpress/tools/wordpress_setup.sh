#!/bin/bash

wp core download --path='/var/www/html' --allow-root
 
if ! wp core is-installed --path='/var/www/html' --allow-root;
	then
		  wp core install --url=$WP_URL \
			--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL \
		--skip-email \
		--path='/var/www/html' \
		--allow-root
fi

if ! wp user list --field=user_login  --path='/var/www/html' --allow-root | grep -q "^$WP_USER$";
	then
		wp user create 	$WP_USER $WP_USER_EMAIL \
						--role=author \
						--user_pass=$WP_PASSWORD \
						--allow-root \
						--path='/var/www/html'
fi

#launch php-pfm
exec "$@"
