#!/usr/bin/env bash

wordpressPerms() {
  # Allow rewriting by app itself.
  wex site/exec -c="chown -R www-data:www-data /var/www/html"
  wex site/exec -c="chmod -R 755 /var/www/html"
}