#!/usr/bin/env bash

laravel5AppConfig() {
  # Inherit from PHP
  wex service/exec -s=php-8 -sf -c=appConfig -a="${1}"

  # when using app/go
  wex app::config/setValue -k=MAIN_CONTAINER_NAME -v="laravel_5"
}