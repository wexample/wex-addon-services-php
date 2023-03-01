#!/usr/bin/env bash

wordpressUpdateArgs() {
  _NEEDS_APP_LOCATION=true
  _DESCRIPTION="Updates WordPress"
}

wordpressUpdate() {
  . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  _wexLog "Wordpress : Updating addons..."
  wex-exec app/exec -n=cli -l -c="wp plugin update --all"
  wex-exec app/exec -n=cli -l -c="wp theme update --all"

  _wexLog "Wordpress : Updating core..."
  wex-exec app/exec -n=cli -l -c="wp core update"

  _wexLog "Wordpress : Updating languages.."
  wex-exec app/exec -n=cli -l -c="wp language core update"
  wex-exec app/exec -n=cli -l -c="wp language plugin update --all"
  wex-exec app/exec -n=cli -l -c="wp language theme update --all"
}
