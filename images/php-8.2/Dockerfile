FROM wexample/php-common:latest

COPY ./addons/services-php/images/php-8.2/entrypoint.sh /docker-entrypoint-php8.sh

# The image php-common comes with libapache2-mod-php which makes Apache uses the
# prefork model. Since we use php-fpm, we switch to the more efficient 'event'
RUN apt-get purge -yq libapache2-mod-php && \
  apt-get autoremove -yq --purge && \
  a2dismod mpm_prefork && \
  a2enmod mpm_event

RUN apt-get update -yq && \
  apt-get install -yq \
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
  && chmod +x /docker-entrypoint-php8.sh \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/docker-entrypoint-php8.sh"]
