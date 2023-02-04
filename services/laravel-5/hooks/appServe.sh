#!/usr/bin/env bash

laravel5AppServe() {
  wex app::app/exec -vv -c="service php7.4-fpm start"
  wex app::app/exec -vv -c="service apache2 restart"
}