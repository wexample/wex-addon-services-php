#!/usr/bin/env bash

wordpressVersionArgs() {
  _NEEDS_APP_LOCATION=true
  _DESCRIPTION="Return current WordPress version"
}

wordpressVersion() {
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  grep -oP "\\\$wp_version.+?'\K[^']+" "wp-includes/version.php"
}
