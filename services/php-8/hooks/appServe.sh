#!/usr/bin/env bash

php8AppServe() {
  wex app::app/exec -c="service php8.2-fpm restart" -i
  wex app::app/exec -c="service apache2 restart" -i
}