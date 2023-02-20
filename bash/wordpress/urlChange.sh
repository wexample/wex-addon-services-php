#!/usr/bin/env bash

wordpressUrlChangeArgs() {
  _ARGUMENTS=(
    'new_url n "New url with trailing slash (ex: http://wexample.com/) " false'
    'old_url o "Old url with trailing slash (ex: http://wexample.com/) " false'
  )
}

wordpressUrlChange() {
  _wexAppGoTo . && . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  # If no new url defined, use local config.
  if [ "${NEW_URL}" = "" ]; then
    . ${WEX_FILEPATH_REL_CONFIG}
    # Do not use https to support local envs.
    NEW_URL="http://${DOMAIN_MAIN}"
  fi

  local OLD_URL
  if [ "${OLD_URL}" = "" ]; then
    # Change database records.
    OLD_URL=$(wex-exec db/exec -c="SELECT option_value FROM ${WP_DB_TABLE_PREFIX}options WHERE option_name = \"siteurl\"")
    OLD_URL="$(echo "$OLD_URL" | tr -d '\r\n')"
  fi

  if [ "${NEW_URL}" = "" ] || [ "${OLD_URL}" = "" ]; then
    return
  fi

  if [ "${NEW_URL}" == "${OLD_URL}" ]; then
    return
  fi

  _wexLog "Search / Replace ${OLD_URL} by ${NEW_URL}"

  wex-exec app/exec -n=cli -c="wp search-replace '${OLD_URL}' '${NEW_URL}' --skip-columns=guid --all-tables"
}
