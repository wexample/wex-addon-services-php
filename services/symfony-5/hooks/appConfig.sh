#!/usr/bin/env bash

symfony5AppConfig() {
  _wexLog "Symfony 5 : configuration"
  printf "\n" >> "${WEX_FILEPATH_REL_CONFIG_BUILD}"
  wex app::config/addTitle -t="Symfony 5"

  # php.ini
  wex app::config/bindFiles -s=php -e=ini
  # apache.conf
  wex app::config/bindFiles -s=apache -e=conf
}