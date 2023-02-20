#!/usr/bin/env bash

laravel5CacheClear() {
  wex-exec app/exec -l -c="php artisan config:clear"
  wex-exec app/exec -l -c="php artisan cache:clear"
  wex-exec app/exec -l -c="php artisan route:clear"
}