#!/bin/bash

# Start mariadb service
service mariadb start;

# Create database and user
mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# Stop mariadb service
mariadb-admin -uroot -p${SQL_ROOT_PASSWORD} shutdown

#Start mariadb service
mysqld_safe
