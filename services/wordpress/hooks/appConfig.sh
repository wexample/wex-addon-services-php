#!/usr/bin/env bash

wordpressAppConfig() {
  # Inherit from PHP
  wex-exec service/exec -s=php-8 -sf -c=appConfig -a="${1}"

  # Change main container name only.
  wex-exec app::config/setValue -k=MAIN_CONTAINER_NAME -v=wordpress
}
