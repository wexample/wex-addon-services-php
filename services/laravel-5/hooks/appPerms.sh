#!/usr/bin/env bash

laravel5AppPerms() {
  wex-exec app/exec -c="chown -R www-data:www-data /var/www/html/public"
  wex-exec app/exec -c="chown -R www-data:www-data /var/www/html/storage"
}
