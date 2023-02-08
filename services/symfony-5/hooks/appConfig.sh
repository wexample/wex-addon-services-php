#!/usr/bin/env bash

symfony5AppConfig() {
  # Inherit from PHP
  wex service/exec -s=php-8 -sf -c=appConfig -a="${1}"

  # Change main container name only.
  wex app::config/setValue -k=MAIN_CONTAINER_NAME -v=symfony_5
}
