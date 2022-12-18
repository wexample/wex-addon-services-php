#!/usr/bin/env bash

phpmyadminAppConfig() {
  _wexLog "PhpMyAdmin : configuration"
  printf "\n" >> "${WEX_FILEPATH_REL_CONFIG_BUILD}"
  wex app::config/addTitle -t="PhpMyAdmin"

  wex app::config/bindFiles -s=php -e=ini

  _wexAppGoTo && . "${WEX_FILEPATH_REL_CONFIG}"

  local DOMAIN
  DOMAIN=$(eval 'echo ${'"${APP_ENV^^}"'_DOMAIN_PMA}')

  if [ "${DOMAIN}" = '' ] && [ "${APP_ENV}" = "local" ];then
    DOMAIN=pma.${APP_NAME}.wex
  fi

  wex app::config/setValue -f=.wex/tmp/config -k=DOMAIN_PMA -v="${DOMAIN}"
}
