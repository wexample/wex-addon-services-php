#!/usr/bin/env bash

wordpressAppGo() {
  wex-exec service/exec -s=php-8 -sf -c=appGo -a="${1}"
}
