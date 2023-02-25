#!/usr/bin/env bash

laravel5AppServe() {
  wex-exec app::app/exec -vv -c="service php7.4-fpm start"
  wex-exec app::app/exec -vv -c="service apache2 restart"
}
