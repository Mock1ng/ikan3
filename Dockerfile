# Stage 1: Composer Installation

FROM composer:latest AS composer
WORKDIR /app
COPY composer.json composer.lock ./
RUN composer install

# Stage 2: Application Runtime

FROM php:apache
WORKDIR /var/www/html
COPY --from=composer /app/vendor ./vendor
COPY . .
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www/html
