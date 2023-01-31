#!/usr/bin/env bash

php8AppInit() {
  . "${WEX_FILEPATH_REL_CONFIG}"
  local SERVICE_DIR=$(wex app::service/dir -s="php-8")

  if [ ! -f "index.php" ]; then
    cp "${SERVICE_DIR}samples/index.php" .
  fi

  wex app::config/setValue -k=MAIN_CONTAINER_NAME -v=php_8
  wex app::config/setValue -k=PROJECT_DIR -v=project
}