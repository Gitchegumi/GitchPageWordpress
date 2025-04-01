FROM wordpress:latest

LABEL maintainer="Mathew Lindholm, @gitchegumi"
LABEL org.opencontainers.image.authors="Mathew Lindholm, @gitchegumi"
LABEL org.opencontainers.image.description="Custom WordPress image with proper permissions to install and update themes and plugins"

RUN mkdir -p /var/www/html/wp-content && \
    chown -R root:root /var/www/html && \
    chown -R www-data:www-data /var/www/html/wp-content && \
    chmod -R 755 /var/www/html/wp-content

COPY wordpress/wp-config.php /var/www/html/wp-config.php

CMD ["docker-entrypoint.sh", "apache2-foreground"]
