#!/usr/bin/env bash

symfony5AppGo() {
  wex service/exec -s=php-8 -sf -c=appGo -a="${1}"
}