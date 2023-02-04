#!/usr/bin/env bash

laravel5AppPerms() {
  wex app/exec -c="chown -R www-data:www-data /var/www/html/public"
  wex app/exec -c="chown -R www-data:www-data /var/www/html/storage"
}