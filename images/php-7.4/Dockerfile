FROM wexample/php-common:latest

COPY ./addons/services-php/images/php-7.4/entrypoint.sh /docker-entrypoint-php7.sh

RUN apt-get update -yq && \
  apt-get install -yq \
  php7.4 \
  php7.4-curl \
  php7.4-fpm \
  php7.4-gd \
  php7.4-imagick \
  php7.4-mbstring \
  php7.4-memcache \
  php7.4-memcached \
  php7.4-mysql \
  php7.4-xml \
  php7.4-zip \
  php7.4-intl \
  && chmod +x /docker-entrypoint-php7.sh \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/docker-entrypoint-php7.sh"]
