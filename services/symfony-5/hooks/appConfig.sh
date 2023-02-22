#!/usr/bin/env bash

symfony5AppConfig() {
  # Inherit from PHP
  wex-exec service/exec -s=php-8 -sf -c=appConfig -a="${1}"
}
