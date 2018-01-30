FROM php:7.0.4-fpm

RUN apt-get update && apt-get install -y --no-install-recommends \
		mysql-client \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
		libmcrypt-dev \
        libpng-dev \
	&& docker-php-ext-install -j$(nproc) mbstring mcrypt pdo_mysql zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

WORKDIR /root

# composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# node npm
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y --no-install-recommends \
		nodejs \
		build-essential