#!/usr/bin/env bash

php8AppInit() {
  . "${WEX_FILEPATH_REL_CONFIG}"

  if [ ! -f "index.php" ]; then
    cp "$(wex app::service/dir -s="php-8")extras/index.php" .
  fi
}