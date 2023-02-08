#!/usr/bin/env bash

wordpressAppServe() {
   wex service/exec -s=php-8 -sf -c=appServe -a="${1}"
}