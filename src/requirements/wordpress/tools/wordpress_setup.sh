#!/bin/bash

sleep 3

conf_file="/var/www/html/wp-config.php"

# Definindo cores para as mensagens de log
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Função para baixar o WordPress se não estiver já instalado
download_wordpress() {
    echo -e "${YELLOW}Attempting to download WordPress...${NC}"
    if wp core download --allow-root; then
        echo -e "${GREEN}Download successful.${NC}"
        return 0
    else
        echo -e "${RED}Download failed.${NC}"
        return 1
    fi
}

# Função para configurar o WordPress
configuration_wordpress() {
    echo -e "${YELLOW}Configuring WordPress...${NC}"
    if wp config create \
        --allow-root \
        --path=/var/www/html/ \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="$MYSQL_HOST"; then
        echo -e "${GREEN}Configuration successful.${NC}"
        return 0
    else
        echo -e "${RED}Configuration failed.${NC}"
        return 1
    fi
}

# Função para instalar o WordPress e criar usuários
install_wordpress() {
    echo -e "${YELLOW}Installing WordPress...${NC}"
    if wp core install \
        --allow-root \
        --url="heda-sil.42.fr" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN" \
        --admin_password="$WP_ADMIM_PASSWORD" \
        --admin_email="$WP_ADMIM_EMAIL"; then
        echo -e "${GREEN}WordPress installed successfully. Creating additional user...${NC}"
        # Cria um segundo usuário após a instalação bem-sucedida
        if wp user create "$WP_USER" "$WP_EMAIL" --role="author" --user_pass="$WP_PASSWORD" --allow-root; then
            echo -e "${GREEN}Additional user created successfully.${NC}"
            return 0
        else
            echo -e "${RED}Failed to create additional user.${NC}"
            return 1
        fi
    else
        echo -e "${RED}WordPress installation failed.${NC}"
        return 1
    fi
}

# Verifica se o WordPress já está configurado
if [ ! -e "$conf_file" ]; then
    attempts=0
    max_attempts=5
    cd /var/www/html/

    if [ -e "/var/www/html/wp-settings.php" ]; then
        echo "WordPress files already present, skipping download."
    else
        until (( attempts >= max_attempts )); do
            download_wordpress && configuration_wordpress && install_wordpress && break
            (( attempts++ ))
            sleep 1
        done
    fi

    if (( attempts >= max_attempts )); then
        echo -e "${RED}Failed to install WordPress.${NC}"
    else
        echo -e "${GREEN}WordPress installation successful.${NC}"
    fi
else
    echo -e "${YELLOW}WordPress already installed and ready to use.${NC}"
fi

/usr/sbin/php-fpm82 -F
