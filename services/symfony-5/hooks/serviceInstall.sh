#!/usr/bin/env bash

symfony5ServiceInstall() {
  wex-exec service/install -i -s=php-8 -g=${1} \
    -ic=false \
    -id=false
}