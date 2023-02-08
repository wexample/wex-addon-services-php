FROM wexample/php-8.2:latest

COPY ./addons/services-php/images/symfony-5/entrypoint.sh /docker-entrypoint-symfony5.sh

# Add Yarn repository.
# Install NodeJS / NPM / Yarn
# Install symfony cli
# Cleanup.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && apt-get install -yq \
  nodejs \
  npm \
  php8.2-bcmath \
  yarn \
  && a2enmod alias proxy_fcgi

RUN wget https://get.symfony.com/cli/installer -O - | bash \
  && npm install n -g \
  && n stable

ENTRYPOINT ["/docker-entrypoint-symfony5.sh"]
