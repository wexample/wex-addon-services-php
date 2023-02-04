FROM wexample/ubuntu-22.04:latest

LABEL authors="wexample <contact@wexample.com>"

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
  sendmail \
  unzip \
  zip \
  -yqq \
  && a2enmod proxy_fcgi setenvif \
  && rm -rf /var/lib/apt/lists/*

# Install apache, might be replaced by php FPM.
RUN apt-get update -yqq && apt-get install apache2 -yqq && \
    sed -i "\$aServerName wexWebServer" /etc/apache2/apache2.conf && \
    usermod -u 1000 www-data && \
    a2enmod expires headers rewrite ssl && \
    mkdir /run/php
