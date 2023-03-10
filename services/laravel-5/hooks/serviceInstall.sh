#!/usr/bin/env bash

laravel5ServiceInstall() {
  wex-exec service/install -s=php-8 -g=${1} \
    -ic=false \
    -id=false

  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v="laravel_5"
}
