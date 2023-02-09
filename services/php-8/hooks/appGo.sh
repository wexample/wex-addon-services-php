#!/usr/bin/env bash

php8AppGo() {
  local CONTAINER_NAME="${1}"

  if [ "${CONTAINER_NAME}" == "php_8" ];then
    # Do not execute action but return it to be piped.
    echo "cd /var/www/html"
  fi
}