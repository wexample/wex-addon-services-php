#!/usr/bin/env bash

wordpressVersion() {
  _wexAppGoTo . && . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  grep -oP "\\\$wp_version.+?'\K[^']+" "wp-includes/version.php"
}