#!/usr/bin/env bash

php8AppServe() {
  wex app::app/exec -vv -c="service php8.2-fpm start"
  wex app::app/exec -vv -c="service apache2 restart"
}