#!/bin/bash
# Secure mariadb installation
mariadb-install-db --datadir=${DATA_DIR} --auth-root-authentication-method=normal \
	--skip-test-db \
	--old-mode='UTF8_IS_UTF8MB3' \
	--default-time-zone=SYSTEM --enforce-storage-engine= \
	--skip-log-bin \
	-expire-logs-days=0 \
	--loose-innobd_buffer_pool_load_at_startup=0 \
	--loose-innodb_buffer_pool_dump_at_shutdown=0

# Create database and user
mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mariadb -uroot -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# Stop mariadb service
mariadb-admin -uroot -p${SQL_ROOT_PASSWORD} shutdown

sleep 1

# Start mariadb service
# mysqld_safe
exec mariadbd -u root --skip-networking=false --port=3306
