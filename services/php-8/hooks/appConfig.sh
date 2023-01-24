#!/usr/bin/env bash

php8AppConfig() {
  wex app::config/addTitle -t=Web
  wex app::config/setValue -k=MAIN_CONTAINER_NAME -v=php_8
  wex app::config/setValue -k=PROJECT_DIR -v=project

  # php.ini
  wex app::config/bindFiles -s=php -e=ini
  # apache.conf
  wex app::config/bindFiles -s=apache -e=conf

  # Create ini file.
  local INI="${WEX_DIR_APP_TMP}php.env.ini"
  local APP_ENV=$(wex app::app/env)

  sudo -u "${WEX_RUNNER_USERNAME}" echo -e "\n\n\n[site]" >> "${INI}"
  _php8AppConfigSetValue APP_ENV "${APP_ENV}"

  if [ "$(wex app::service/user -s=mysql)" = "true" ] || [ "$(wex app::service/user -s="mysql-8")" = "true" ] || [ "$(wex app::service/user -s="maria-10")" = "true" ];then
    . "${WEX_FILEPATH_REL_CONFIG}"

    sudo -u "${WEX_RUNNER_USERNAME}" echo -e "\n\n\n[mysql]" >> "${INI}"
    local DEFAULT_HOST="${NAME}_$(wex app::app/env)_mysql";
    local DEFAULT_PASSWORD='thisIsAReallyNotSecurePassword!'

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
  wex default::config/setValue -s=" = " -k="${KEY}" -v="${VALUE}" -f="${INI}"
}
