#!/usr/bin/env bash

wordpressUpdate() {
  _wexAppGoTo . && . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  _wexLog "Wordpress : Updating addons..."
  wex app/exec -n=cli -l -c="wp plugin update --all"
  wex app/exec -n=cli -l -c="wp theme update --all"

  _wexLog "Wordpress : Updating core..."
  wex app/exec -n=cli -l -c="wp core update"

  _wexLog "Wordpress : Updating languages.."
  wex app/exec -n=cli -l -c="wp language core update"
  wex app/exec -n=cli -l -c="wp language plugin update --all"
  wex app/exec -n=cli -l -c="wp language theme update --all"
}