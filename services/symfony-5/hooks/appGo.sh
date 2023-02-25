#!/usr/bin/env bash

symfony5AppGo() {
  local CONTAINER_NAME="${1}"

  if [ "${CONTAINER_NAME}" == "symfony_5" ]; then
    wex-exec service/exec -s=php-8 -sf -c=appGo -a="php_8"
  fi
}
