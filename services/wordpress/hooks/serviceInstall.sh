#!/usr/bin/env bash

wordpressServiceInstall() {
  wex app::config/setValue -b -k=WP_DB_TABLE_PREFIX -v=wp
  wex app::config/setValue -b -k=WP_VERSION -v="6.1.1"
}