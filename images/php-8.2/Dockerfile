FROM wexample/ubuntu-22.04:latest

LABEL authors="wexample <contact@wexample.com>"

COPY ./project/addons/services-php/images/php-8.2/entrypoint.sh /docker-entrypoint-php8.sh

RUN apt-get update -yq && \
  apt-get install \
  software-properties-common -yqq && \
  add-apt-repository ppa:ondrej/php -y && \
  apt-get update -yq && \
  apt-get install \
  composer \
  curl \
  libapache2-mod-php \
  memcached \
  mysql-client \
  nano \
  php8.2 \
  php8.2-curl \
  php8.2-fpm \
  php8.2-gd \
  php8.2-imagick \
  php8.2-mbstring \
  php8.2-memcache \
  php8.2-memcached \
  php8.2-mysql \
  php8.2-xml \
  php8.2-zip \
  php8.2-intl \
  sendmail \
  unzip \
  zip \
  -yqq \
  && a2enmod proxy_fcgi setenvif \
  && a2enconf php8.2-fpm \
  && chmod +x /docker-entrypoint-php8.sh \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/docker-entrypoint-php8.sh"]
