FROM php:7.2.7-fpm-alpine3.7

RUN apk update;
RUN apk upgrade;
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 
RUN composer require "twig/twig:^2.0" --no-interaction






