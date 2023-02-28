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

# Enforce composer to run with PHP 7.4
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer

ENTRYPOINT ["/docker-entrypoint-php7.sh"]
