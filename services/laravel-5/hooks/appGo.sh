#!/usr/bin/env bash

laravel5AppGo() {
  wex-exec service/exec -s=php-8 -sf -c=appGo -a="php_8"
}
