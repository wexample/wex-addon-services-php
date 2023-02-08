#!/usr/bin/env bash

wordpressAppGo() {
  wex service/exec -s=php-8 -sf -c=appGo -a="${1}"
}