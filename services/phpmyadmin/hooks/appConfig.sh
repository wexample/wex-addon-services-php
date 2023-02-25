#!/usr/bin/env bash

phpmyadminAppConfig() {
  wex-exec app::config/bindFiles -s=php -e=ini
}
