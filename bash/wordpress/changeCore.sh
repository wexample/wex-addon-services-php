#!/usr/bin/env bash

wordpressChangeCoreArgs() {
  _DESCRIPTION="Replace WP core with another version, useful for downgrading. Let user to update database from admin."
  _ARGUMENTS=(
    'version v "Wordpress destination version number (ex: 4.9.5)" true'
  )
}

wordpressChangeCore() {
  _wexAppGoTo . && . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

   wex-exec app/exec -su -c="apt-get update && apt-get install wget zip -y"

  local FILENAME='wordpress-'${VERSION}'.zip'
  # Download last version.
  _wexLog "Downloading ${FILENAME}..."
  wex-exec app/exec -su -c="cd /var/www && rm -rf wordpress && rm -rf ${FILENAME} && wget https://wordpress.org/${FILENAME} && unzip ${FILENAME} && rm ${FILENAME}"

  wex-exec app/exec -su -c="chown -R ${APP_USER_UID}:${APP_USER_UID} /var/www/html"
  wex-exec app/exec -su -c="chown -R ${APP_USER_UID}:${APP_USER_UID} /var/www/wordpress"

  # Remove old files.
  _wexLog "Replacing core files..."
  wex-exec app/exec -c="rm -rf ./wp-includes && rm -rf ./wp-admin"
  # Copy new
  wex-exec app/exec -c="cp -r /var/www/wordpress/wp-includes /var/www/html"
  wex-exec app/exec -c="cp -r /var/www/wordpress/wp-admin /var/www/html"
  # Copy without removing existing.
  wex-exec app/exec -c="cp -r /var/www/wordpress/wp-content /var/www/html"
  # Copy root files, omit directories.
  wex-exec app/exec -c="cp /var/www/wordpress/* /var/www/html" | grep -v 'omitting directory'
  # Now user should visit wp-admin for database migration or run wp cli update
}