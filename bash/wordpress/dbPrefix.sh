#!/usr/bin/env bash

wordpressDbPrefixArgs() {
  _NEEDS_APP_LOCATION=true
  # shellcheck disable=SC2034
  _DESCRIPTION="Find database tables prefix"
}

wordpressDbPrefix() {
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  if [ "${WP_DB_TABLE_PREFIX}" ]; then
    echo "${WP_DB_TABLE_PREFIX}"
    return
  fi

  echo 'wp_'
}
