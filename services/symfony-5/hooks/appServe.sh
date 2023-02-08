#!/usr/bin/env bash

symfony5AppServe() {
   wex service/exec -s=php-8 -sf -c=appServe -a="${1}"
}