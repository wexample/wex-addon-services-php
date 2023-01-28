#!/usr/bin/env bash

wordpressAppConfig() {
  # Set values
  local SERVICE_DIR
  SERVICE_DIR=$(wex app::service/dir -s=php-8)

  source "${SERVICE_DIR}hooks/appConfig.sh"

  php8AppConfig

  # Change main container name only.
  wex app::config/setValue -k=MAIN_CONTAINER_NAME -v=wordpress
}
