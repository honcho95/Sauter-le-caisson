#!/bin/bash

# Replace placeholders in wp-config.php with actual database credentials
sed -i "s/\$DB_USER/$DB_ADMIN/" /var/www/wordpress/wp-config.php
sed -i "s/\$DB_NAME/$DB_DATA_BASE_NAME/" /var/www/wordpress/wp-config.php
sed -i "s/\$DB_PASSWORD/$DB_ADMIN_PASSWORD/" /var/www/wordpress/wp-config.php

# Check if WordPress is already configured
if [ -f "/var/www/wordpress/conf" ]; then
    echo "WordPress is already configured."
else
    cd /var/www/wordpress || exit # Exit if the directory does not exist

    # Wait for MySQL to be ready to accept connections
    sleep 10

    # Download WordPress core files
    wp core download --allow-root --locale=fr_FR
    
    # Install WordPress
    wp core install --allow-root --url="https://tbaskhan.42.fr/" --title="Inception tbaskhan" --admin_name="$WP_ADMIN_USER" --admin_email="$WP_ADMIN_EMAIL" --admin_password="$WP_ADMIN_PASSWORD"
    
    # Install and activate a simple theme, e.g., Astra
    wp theme install astra --activate --allow-root

    # Create an additional WordPress user
    wp user create "$WP_USER" other@gmail.com --user_pass="$WP_USER_PASSWORD" --allow-root

    # Create a file to indicate WordPress has been configured
    touch conf
fi

# Start PHP-FPM server in foreground mode and restart it if it crashes
exec /usr/sbin/php-fpm7.3 -F -R
