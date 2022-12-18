#!/usr/bin/env bash

phpmyadminAppConfig() {
  wex app::config/addTitle -t="PhpMyadmin"

  # Need php/phpmyadmin.ini even
  # if web container does not exists
  wex app::config/bindFiles -s=php -e=ini
}
