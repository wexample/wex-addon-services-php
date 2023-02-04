#!/usr/bin/env bash

laravel5AppGo() {
  wex service/exec -s=php-8 -sf -c=appGo -a="${1}"
}