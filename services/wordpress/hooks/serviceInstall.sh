#!/usr/bin/env bash

wordpressServiceInstall() {
  wex-exec app::config/setValue -b -k=WP_DB_TABLE_PREFIX -v=wp
  wex-exec app::config/setValue -b -k=WP_VERSION -v="6.1.1"
  wex-exec app::config/setValue -b -k=MAIN_CONTAINER_NAME -v=wordpress
}