#!/usr/bin/env bash

phpmyadminServiceInstall() {
  local DOMAIN_PMA
  . "${WEX_FILEPATH_REL_CONFIG}"

  if [ "${DOMAIN_PMA}" = "" ]; then
    local DOMAIN
    DOMAIN=$(eval 'echo ${'"${APP_ENV^^}"'_DOMAIN_PMA}')

    if [ "${CONTEXT_ENV}" = "local" ]; then
      if [ "${DOMAIN_MAIN}" = '' ]; then
        DOMAIN=pma.${NAME}.wex
      else
        DOMAIN=pma.${DOMAIN_MAIN}
      fi
    fi

    wex-exec app::config/setValue -b -k=DOMAIN_PMA -v="${DOMAIN}"
  fi
}
