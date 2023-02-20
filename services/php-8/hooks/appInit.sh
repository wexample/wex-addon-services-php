#!/usr/bin/env bash

php8AppInit() {
  . "${WEX_FILEPATH_REL_CONFIG}"
  local SERVICE_DIR=$(wex-exec app::service/dir -s="php-8")

  if [ ! -f "index.php" ]; then
    cp "${SERVICE_DIR}samples/index.php" .
  fi

  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=php_8
}