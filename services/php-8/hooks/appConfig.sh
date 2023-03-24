#!/usr/bin/env bash

php8AppConfig() {
  # php.ini
  wex-exec app::config/bindFiles -s=php -e=ini
  # apache.conf
  wex-exec app::config/bindFiles -s=apache -e=conf

  # Create ini file.
  local INI="${WEX_DIR_APP_TMP}php.env.ini"
  local APP_ENV=$(wex-exec app::app/env)

  echo -e "\n\n\n[site]" >>"${INI}"
  _php8AppConfigSetValue APP_ENV "${CONTEXT_ENV}"

  if [ "$(wex-exec app::service/used -s=mysql)" = "true" ] || [ "$(wex-exec app::service/used -s="mysql-8")" = "true" ] || [ "$(wex-exec app::service/used -s="maria-10")" = "true" ]; then
    . "${WEX_FILEPATH_REL_CONFIG}"

    echo -e "\n\n\n[mysql]" >>"${INI}"
    local DEFAULT_HOST="${NAME}_$(wex-exec app::app/env)_mysql"
    local DEFAULT_PASSWORD=${WEX_DEFAULT_INSECURE_PASSWORD}

    _php8AppConfigSetValue "MYSQL_DB_HOST" "${MYSQL_DB_HOST:-${DEFAULT_HOST}}"
    _php8AppConfigSetValue "MYSQL_DB_PORT" "${MYSQL_DB_PORT:-3306}"
    _php8AppConfigSetValue "MYSQL_DB_NAME" "${MYSQL_DB_NAME:-${NAME}}"
    _php8AppConfigSetValue "MYSQL_DB_USER" "${MYSQL_DB_USER:-root}"
    _php8AppConfigSetValue "MYSQL_DB_PASSWORD" "${MYSQL_DB_PASSWORD:-${DEFAULT_PASSWORD}}"
  fi
}

_php8AppConfigSetValue() {
  local INI="${WEX_DIR_APP_TMP}php.env.ini"
  local KEY="${1}"
  local VALUE="${2}"

  _wexLog "Setting value for ${KEY} to ${VALUE}"
  wex-exec default::config/setValue -s=" = " -k="${KEY}" -v="${VALUE}" -f="${INI}"
}
