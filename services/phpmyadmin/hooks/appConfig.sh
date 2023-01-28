#!/usr/bin/env bash

phpmyadminAppConfig() {
  wex app::config/bindFiles -s=php -e=ini

  . "${WEX_FILEPATH_REL_CONFIG}"

  local DOMAIN
  DOMAIN=$(eval 'echo ${'"${APP_ENV^^}"'_DOMAIN_PMA}')

  if [ "${APP_ENV}" = "local" ]; then
    if [ "${DOMAIN_MAIN}" = '' ]; then
      DOMAIN=pma.${NAME}.wex
    else
      DOMAIN=pma.${DOMAIN_MAIN}
    fi
  fi

  wex app::config/setValue -k=DOMAIN_PMA -v="${DOMAIN}"
}
