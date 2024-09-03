#!/bin/bash

wp core download --path='/var/www/html' --allow-root
 
# SQL_DATABASE=mariadb
# SQL_HOST=mariadb:3306
# SQL_USER=heda-sil
# SQL_PASSWORD=0123456789
# SQL_ROOT_PASSWORD=9876543210

# # Wordpress
# WP_URL=heda-sil.42.fr
# WP_TITLE=no-title-page
# WP_USER=heda-sil
# WP_EMAIL=heda-sil@example.com
# WP_PASSWORD=0123456789
# WP_ADMIN=admin
# WP_ADMIN_EMAIL=admin@example.com
# WP_ADMIN_PASSWORD=9876543210

# wp config create --dbname=$SQL_DATABASE \
# 	--dbuser=$WP_USER \
# 	--dbpass=$WP_PASSWORD \
#  	--dbhost=$SQL_HOST \
#  	--path='/var/www/html' \
#  	--allow-root

# wp core config --dbname=$SQL_DATABASE \
#  	 --dbuser=$WP_USER \
#  	 --dbpass=$WP_PASSWORD \
#  	--dbhost=$SQL_HOST \
#  	--path='/var/www/html' \
#  	--allow-root

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
