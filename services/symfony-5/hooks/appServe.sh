#!/usr/bin/env bash

symfony5AppServe() {
  wex-exec service/exec -s=php-8 -sf -c=appServe -a="${1}"
}
