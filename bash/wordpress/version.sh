#!/usr/bin/env bash

wordpressVersionArgs() {
  _DESCRIPTION="Return current WordPress version"
}

wordpressVersion() {
  _wexAppGoTo . && . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  grep -oP "\\\$wp_version.+?'\K[^']+" "wp-includes/version.php"
}
