# Use official PHP image with Apache
FROM php:8.2-apache

# Install required extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    && docker-php-ext-install zip

# Enable Apache rewrite module
RUN a2enmod rewrite

# Copy application files
COPY . /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod 755 /var/www/html \
    && chmod 644 /var/www/html/index.php \
    && chmod 644 /var/www/html/composer.json \
    && chmod 666 /var/www/html/users.json \
    && chmod 666 /var/www/html/error.log

# Expose port 80
EXPOSE 80